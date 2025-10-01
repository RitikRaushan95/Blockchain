// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract byteDataType{
    bytes1 public arr1='A';
    bytes2 public arr2='AB';
    bytes3 public arr3='ABC';

    bytes1 public firstChar;
    bytes1 public secondChar;
    bytes1 public thirdChar;

    function othInd() public returns(bytes1){
        firstChar=arr3[0];
        return  firstChar;
    }
    function firstInd() public returns(bytes1){
        secondChar=arr3[1];
        return secondChar;
    }
    function sendthInd() public returns(bytes1){
        thirdChar=arr3[2];
        return thirdChar;
    }

}