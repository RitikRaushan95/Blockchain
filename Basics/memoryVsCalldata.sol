// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract memVsCallData{
    uint[5] public arr=[1,2,3];
    //memory-> It's used in mutable case means if we have to
    //change anything or modify

    function multiply(uint[5] memory _arr) public pure
    returns(uint[5] memory){
        for(uint i=0;i<_arr.length;i++)
        _arr[i]*=2;
        return _arr;
    }

    //calldata-> It's used in case of immutable means data
    //can't be changed just read

    function passingArray(uint[5] calldata _arr) public pure returns(uint){
        uint a=_arr[0];
        a*=2;
        return a;
    }
}