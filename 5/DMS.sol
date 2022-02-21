// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

contract DeadManSwitch{
    address public owner;
    uint public prevAliveBlock;
    address payable public backupAddress;

    constructor(){
        backupAddress = payable(0x92DFe4b921873F3dC7Dd9304142116aD62201525);
        owner = msg.sender;
        prevAliveBlock = block.number;
    }
    modifier isOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    modifier isAlive{
        require(prevAliveBlock + 10 < block.number);
        _;
    }
    function still_alive() public isOwner {
        prevAliveBlock = block.number;
    }
    function DMswitch() public payable isAlive{
        uint amount = address(this).balance;
        (bool sent, ) = backupAddress.call{value: amount}("");
        require(sent, "Failed to send balance to backupadress");
    }
}