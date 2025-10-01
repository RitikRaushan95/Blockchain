// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract typeCasting{
    uint256 public num1=256;
    uint8 public num2=uint8(num1);
    //if we assign num1=256 then num2 will become 0 bcz 256
    //cant assigned to 8 bit;
}