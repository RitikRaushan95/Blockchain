// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract variables{
    uint stateVar=10;
    function localVar() public pure returns (uint) {
        uint var2=20;
        return var2;
    }
    function stateVariable() public view returns(uint){
        return stateVar;
    }
}