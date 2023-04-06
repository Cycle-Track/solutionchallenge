# cycle_track

The latest folder for the Cycle Track Solution is the 6.0 and it has the wireframe, the frontend and backend files including the server

This is what our final page will look like:

Here is a wireframe idea of a bicycle tracking website that runs on blockchain:

1. Home Page

2. Track a Ride Page

3. Ride History Page

4. Profile Page

5. About Us Page

6. Contact Us Page


For the Hardhat Installation, just in case you want to test run

1. run "npm init" 
2. install hardhat using "npx install --save-dev hardhat"
3. Run "npx hard", select "create an empty hardhat.config.js"
4. install recommended tools using "npm install --save-dev @nomicfoundation/hardhat-toolbox"
5. add "require("@nomicfoundation/hardhat-toolbox");" to "hardhat.config.js" file
6. create new directory called "contracts" and add/create solidity files
7. compile the contracts using "npx hardhat compile"
8. install usefull tools using "npm install @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers"
9. create a new folder called "scripts" and add a "deploy.js" file
10.create a ".env" file an run the command: "npm install --dev dotenv"
11. in hardhat.config.js, add ['require("@nomiclabs/hardhat-waffle");', "require("@nomiclabs/hardhat-etherscan");"]
12. install etherscan plugging using "npm install --save-dev @nomiclabs/hardhat-etherscan"
13. deploy contracts using "npx hardhat run scripts/deploy.js"
14. to verify contract, get an API_KEY from etherscan. first, sign up to etherscan. UserName:JCycle, Password:Cycletrack@123,
15  install deploy plugging using "npm install -D hardhat-deploy" then add "require('hardhat-deploy');" to your hardhat.config.js file
16. run "npm install --save-dev  @nomiclabs/hardhat-ethers@npm:hardhat-deploy-ethers ethers"
