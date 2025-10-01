// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract modifierProgram {
    uint public num = 10;

    modifier onlyValid(uint numb) {
        require(numb % 2 == 0, "Not Even");
        _;
    }

    function check1(uint a) public onlyValid(a) {
        num = 100;
    }

    function check2(uint b) public onlyValid(b) {
        num = 200;
    }

    function check3(uint c) public onlyValid(c) {
        num = 300;
    }
}
