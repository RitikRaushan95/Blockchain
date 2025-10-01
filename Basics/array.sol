// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract fixedArray{
    uint[5] public arr=[1,2,3];
    function insertElemntAtIndex(uint index, uint val) public{
        arr[index]=val;
    }
    function returnElement(uint indx) public view returns(uint){
        return arr[indx];
    }
    function returnArray() public view returns(uint[5] memory){
        return arr;
    }
}

contract dynamicArray{
    uint[] public arr1=[1,2,3];

    function addelemnt(uint x) public {
        arr1.push(x);
        arr1.push(x+2);
        arr1.push(x+3);
    }
    function getLength() public view returns(uint){
        return arr1.length;
    }

    function deleteElement() public{
        arr1.pop();
        arr1.pop();
    }
     function returnArray() public view returns(uint[] memory){
        return arr1;
    }

}