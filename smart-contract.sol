pragma solidity ^0.8.0;

// SPDX-License-Identifier: UNLICENSED

contract GPSTracking {

struct GPSData {
  uint id;
  uint timestamp;
  string latitude;
  string longitude;
  uint altitude;
  uint accuracy;
  address sender;
}


  mapping (address => GPSData[]) public gpsDataBySender;

  function addGPSData(string memory _latitude, string memory _longitude) public {
    GPSData memory gpsData = GPSData({
      timestamp: block.timestamp,
      latitude: _latitude,
      longitude: _longitude,
      sender: msg.sender
    });
    gpsDataBySender[msg.sender].push(gpsData);
  }

  function getGPSDataBySender(address _sender) public view returns (GPSData[] memory) {
    return gpsDataBySender[_sender];
  }

}
