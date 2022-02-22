// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "../contracts/1_Storage.sol";

contract StorageTest {
    Storage temp = new Storage();
    function beforeAll() public {
        // Here should instantiate tested contract
        Assert.equal(uint(1), uint(1), "1 should be equal to 1");
        Assert.greaterThan(uint(2), uint(1), "2 should be greater than to 1");
        Assert.lesserThan(uint(2), uint(3), "2 should be lesser than to 3");
    }
    function valueIsSet() public {
        temp.store(1);
        Assert.equal(temp.retrieve(),uint(1), "value is not 1");
    }
}