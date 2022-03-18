//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

/*
 *****************
 *** Libraries ***
 *****************
 */

library MyMathLib {
    function sum(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract ContractMath {
    function checkResult() public pure returns (uint256) {
        return MyMathLib.sum(34, 56);
    }

    using MyMathLib for uint256;

    function checkResultUpdated() public pure returns (uint256) {
        uint256 a = 12;
        return a.sum(45);
    }

    /*
     *************
     *** Event ***
     *************
     */
    event DataUpdated(uint256 value, address from);

    function doSomeWork() public {
        emit DataUpdated(56, msg.sender);
    }

    /*
     **********************
     *** Error Handling ***
     **********************
     */
    function mint(uint256 numbersOfTokens) public {
        require(numbersOfTokens < 10, "Number of tokens less than 10 required");
        if (numbersOfTokens > 5 && numbersOfTokens < 10) {
            if (numbersOfTokens > 7 && numbersOfTokens < 9) {
                revert("Testing revert");
            }
        }

        // assert(totalSupply < 10000);
    }
}
