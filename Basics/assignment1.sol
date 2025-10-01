// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Assignment{
    struct Store{
        address user;
        uint eth;
        uint time;
    }
    Store[] public U1;
    function setUser() public payable{
            U1.push(Store(msg.sender, msg.value, block.timestamp));
        //  U1.push(
        //     Store({user: _user,eth: _eth,time: block.timestamp})
        //     );
    }
    function getUser(uint index) public view returns(Store memory){
        return U1[index];
    } 
}