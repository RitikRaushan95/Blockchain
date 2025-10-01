// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract boolProgram{
    bool public isTrue = true;
    function setFalse() public view returns(bool){
        return !isTrue;
    }
}