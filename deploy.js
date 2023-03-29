const ethers = require("ethers")
const fs = require("fs-extra")
const { Storage } = require('@google-cloud/storage');

const sourceFolderPath = path.resolve(__dirname, 'contracts');
const buildFolderPath = path.resolve(__dirname, 'build');


async function main() {
    let provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL)
    let wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider)
    const abi = fs.readFileSync("the_contract_abi", "utf8")
    const binary = fs.readFileSync("the_contract_binary_code", "utf8")
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    const contract = await contractFactory.deploy()


}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })

const storage = new Storage();
const bucketName = 'cycletrack.app';
const fileName = 'bike.sol';

async function fetchDataAndSendToCloud() {
    const data = await contract.getValue();
    const file = storage.bucket(bucketName).file(bike.sol);
    await file.save(JSON.stringify(data));
}

fetchDataAndSendToCloud();
