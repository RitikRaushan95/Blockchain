// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract constructorProgram{
    //executed only once
    //Only oine constructoir can be created
    uint public num=10;
    constructor(){
        num=0;
    }
   
}