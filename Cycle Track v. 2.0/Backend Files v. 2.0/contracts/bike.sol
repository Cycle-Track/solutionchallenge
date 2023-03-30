// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BicycleToken {

    struct Bicycle {
        address owner;
        bytes32 bikeHash;
        bytes32 privateKey;
        string publickey;
        bool stolen;
        uint year;
        string brand;
        string model;
        string color;
        uint frameSize;
        string serialNumber;
        bool isRegistered;
    }



    mapping (uint256 => Bicycle) bicycles;
    uint256 public bikeCount;

    event BikeProduced(uint256 bikeId, bytes32 bikeHash);
    event BikePurchased(uint256 bikeId, bytes32 privateKey);
    event BikeStolen(uint256 bikeId);
    event BikeRecovered(uint256 bikeId, address newOwner);

    function produceBicycle(bytes32 _bikeHash, uint _year, string memory _brand, string memory _model, string memory _color, uint _frameSize, string memory _serialNumber) public {
        require(_bikeHash != "", "Bike hash cannot be empty.");
        bicycles[bikeCount] = Bicycle(msg.sender, _bikeHash, "", "", false, _year, _brand, _model, _color, _frameSize, _serialNumber, true);
        emit BikeProduced(bikeCount, _bikeHash);
        bikeCount++;
    }

    function purchaseBicycle(uint256 _bikeId, bytes32 _privateKey, string memory _publicKey) public {
        require(_bikeId < bikeCount, "Bike ID does not exist.");
        require(bicycles[_bikeId].owner != address(0), "Bike is not registered.");
        require(bicycles[_bikeId].owner != msg.sender, "You already own this bike.");
        require(bicycles[_bikeId].stolen == false, "Bike is reported as stolen.");
        bicycles[_bikeId].privateKey = _privateKey;
        bicycles[_bikeId].publickey = _publicKey;
        bicycles[_bikeId].owner = msg.sender;
        emit BikePurchased(_bikeId, _privateKey);
    }

   function reportBicycleStolen(uint256 _bikeId) public {
        require(_bikeId < bikeCount, "Bike ID does not exist.");
        require(bicycles[_bikeId].owner == msg.sender, "Only the bike owner can report the bike as stolen.");
        require(bicycles[_bikeId].stolen == false, "Bike is already reported as stolen.");
        require(bicycles[_bikeId].isRegistered == true, "Bike is not registered.");
        bicycles[_bikeId].stolen = true;
        emit BikeStolen(_bikeId);
    }

    function recoverBicycle(uint256 _bikeId) public {
        require(_bikeId < bikeCount, "Bike ID does not exist.");
        require(bicycles[_bikeId].owner != msg.sender, "Bike owner cannot recover the bike.");
        require(bicycles[_bikeId].stolen == true, "Bike is not reported as stolen.");
        require(bicycles[_bikeId].isRegistered == true, "Bike is not registered.");
        bicycles[_bikeId].owner = msg.sender;
        bicycles[_bikeId].stolen = false;
        emit BikeRecovered(_bikeId, msg.sender);
    }

    function getBicycleLocation(uint256 _bikeId, bytes32 _privateKey) public view returns (bytes32) {
        require(_bikeId < bikeCount, "Bike ID does not exist.");
        require(bicycles[_bikeId].privateKey == _privateKey, "Invalid private key.");
        return bicycles[_bikeId].bikeHash;
    }

    function getBicycleDetails(uint256 _bikeId) public view returns (uint256, string memory, string memory, string memory, uint256, string memory, bytes32, bytes32, bool) { // the types here
        require(_bikeId < bikeCount, "Bike ID does not exist.");
        Bicycle storage bike = bicycles[_bikeId];
        return (bike.year, bike.brand, bike.model, bike.color, bike.frameSize, bike.serialNumber, bike.bikeHash, bike.privateKey, bike.isRegistered);//the types here
    }
    
}