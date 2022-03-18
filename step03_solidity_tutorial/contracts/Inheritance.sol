//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

/*
 *******************
 *** Inheritance ***
 *******************
 */

contract InheritanceMaster {
    // private state variable
    uint256 private data;
    // Public state variable
    uint256 public info;

    // constructor
    constructor() {
        info = 10;
    }

    // private function
    function increment(uint256 a) private pure returns (uint256) {
        return a + 1;
    }

    //public function
    function updateData(uint256 a) public {
        data = a;
    }

    function getData() public pure virtual returns (uint256) {
        return 45;
    }

    function compute(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract InheritanceChild is InheritanceMaster {
    uint256 private result;

    constructor(uint256 _result) {
        result = _result;
    }

    function getComputedResult() public {
        result = compute(3, 5);
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function getData() public pure override returns (uint256) {
        return 5;
    }
}

contract Inheritance {
    InheritanceChild private b;
    InheritanceMaster private a;

    constructor() {
        b = new InheritanceChild(101);
        a = new InheritanceChild(111);
    }

    function checkFunction1() public view returns (uint256) {
        // b.compute(5, 6);   --- compute function not available here as it is an internal function of Master not child
        // b.increment(5);    --- increment function not available here as it is private function of Master
        // b.getResult();
        return a.getData();
    }

    function checkFunction2() public view returns (uint256) {
        // b.compute(5, 6);   --- compute function not available here as it is an internal function of Master not child
        // b.increment(5);    --- increment function not available here as it is private function of Master
        // b.getResult();
        return b.getData();
    }
}
