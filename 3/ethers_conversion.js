const { ethers } = require("ethers");
let text = "I'm new to Ethereum"

let bytes32 = ethers.utils.formatBytes32String(text)
console.log(bytes32)
