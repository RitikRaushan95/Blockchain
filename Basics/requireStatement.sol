// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract requireProgRam{
    bool public result;
    function checkEven(uint a) public returns(bool){
        result=true;
        require(a%2==0,"A is not an even Number");
        return result;
    }
}