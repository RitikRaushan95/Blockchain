// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract functions{
    uint num1=10;
    uint num2=20;
    //Pure is used when its independent of state variables 
    //but if its dependent then we use view
    function addition() public pure returns(uint){
        uint a=10;
        uint b=20;
        return a+b;
    }
    function subtraction() public view returns(uint){
        return num2-num1;
    }
    function multiplication() public view returns(uint){
        return num1*num2;
    }
    function divide(uint a, uint b) public pure returns(uint){
        return a/b;
    }

}

