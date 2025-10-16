// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract DAO{

    struct Proposal{
        uint id;
        string description;
        uint amount;
        address payable receipient;
        uint votes;
        uint end;
        bool isExecuted;
    }

    mapping(address=>bool) private isInvestor;
    mapping(address=>uint) public numOfShares;
    mapping(address=>mapping(uint=>bool)) public isVoted;
    mapping(address=>mapping(address=>bool)) public withdrawlStatus;
    address[] public investorList;
    mapping(uint=>Proposal) public proposals;

    uint public totalShares;
    uint public availableFund;
    uint public contributionTimeEnd;
    uint public nextProposalId;
    uint public voteTime;
    uint public quorum;
    address public manager;
     
    constructor(uint _contributionTimeEnd, uint _voteTime, uint _quorum){
        require(_quorum >0 && _quorum<100,"Not a valid value");
        contributionTimeEnd=block.timestamp+_contributionTimeEnd;
        voteTime=_voteTime;
        quorum=_quorum;
        manager=msg.sender;
    }

    modifier onlyInvestor(){
        require(isInvestor[msg.sender]==true," You are not an Investor");
        _;
    }

    modifier onlyManager(){
        require(manager==msg.sender," You are not a manager");
        _;
    }

    function contribution() public payable {
        require(contributionTimeEnd>block.timestamp,"Contribution time has ended");
        
    }
}