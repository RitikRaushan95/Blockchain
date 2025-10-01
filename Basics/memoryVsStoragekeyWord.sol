// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract memoryVsStorageKeyword{
    uint[5] public arr=[1,2,3];
    function storageKeyword() public {
        uint[5] storage brr;
        brr=arr;  
        brr[0]=6;
         //here brr act as a pointer to arr so the change will
        //also be reflected in arr
    }

    function getArray() public view returns(uint[5] memory){
        return arr;
    }

    function memoryKeyword() public view {
        uint[5] memory crr;
        crr=arr;  
        crr[0]=6;
         //here crr act as a copy to arr so the change will not
        //be reflected in arr
    }
}