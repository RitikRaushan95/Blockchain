// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Vote{

    struct Voter{
        string name;
        uint age;
        uint voterId;
        string gender;
        uint voteCandidateId; // Candidate Id to whom the voter has voted
        address voterAddress;
    }

     struct Candidate{
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes; //Number of total votes received by the candidate
    }
    
    address electionCommision;
    address public winner;

    uint nextVoterId=1;  //voterId for voters
    uint nextCandidateId=1;  //candidateId for candidates

    uint startTime;
    uint endTime;

    mapping(uint=>Voter) public votersDetails; //to store voters
    mapping(uint=>Candidate) public candidatesDetails; //to store candidates
    bool stopVoting; //Emergency case to stop voting

    constructor(){
        electionCommision=msg.sender;
    }

    modifier isVotingOver(){
        require(endTime>block.timestamp && stopVoting!=true,"Voting is Over");
       _;
    }

    modifier onlyCommisioner(){
        require(msg.sender==electionCommision,"you're not an election Commisioner");
       _;
    }

    function CandidateRegister(
        string calldata _name,
        string calldata _party,
        uint _age,
        string calldata _gender
    ) external {
        require(_age>=18,"You're minor");
        require(candidateVerification(msg.sender),"Candidate already registered");
        require(nextCandidateId<=2,"Candidate seat full");
        candidatesDetails[nextCandidateId]=Candidate({
            name:_name,
            party:_party,
            age:_age,
            gender:_gender,
           candidateId:nextCandidateId,
           candidateAddress:msg.sender,
           votes:0
        });
        nextCandidateId++;
    }

    function candidateVerification(address _person)internal view returns(bool){
        for(uint i=1;i<=nextCandidateId;i++){
           if( candidatesDetails[i].candidateAddress== _person) return false;
        }
        return true;
    }

    function candidateList()public view returns(Candidate[] memory){
        //Array of length nextCandidateId-1 to store all candidates in that array
        Candidate[] memory ListsOfCand=new Candidate[](nextCandidateId-1);
        for(uint i=1;i<nextCandidateId;i++){
            ListsOfCand[i-1]=candidatesDetails[i];
        }
        return ListsOfCand;
    }

    function voterRegister(
        string calldata _name,
        uint _age,
        string calldata _gender
    ) external{
        require(_age>=18,"You're minor");
        require(voterVerification(msg.sender),"You're already Registered");
        votersDetails[nextVoterId]=Voter({
            name:_name,
            age:_age,
            voterId:nextVoterId,
            gender:_gender,
            voteCandidateId:nextCandidateId,
            voterAddress:msg.sender
        });
        nextVoterId++;
    }

    function voterVerification(address _person) internal view returns(bool){
        for(uint i=1;i<=nextVoterId;i++){
           if( votersDetails[i].voterAddress==_person)return false;
        }
        return true;
    }

    function voterList() public view returns(Voter[] memory){
        Voter[] memory votersList= new Voter[](nextVoterId-1);
        for(uint i=1;i<nextVoterId;i++){
            votersList[i-1]=votersDetails[i];
        }
        return votersList;
    }

    function vote(uint _voterId, uint _CandId) external  {
        // Voting should be allowed only in voting period
        // Minimun 2 candidates are required for voting
        require(startTime==0,"Votig has not started");
        require(startTime>0 && endTime<block.timestamp,"Voting is allowed only in voting period");
        require(nextCandidateId>=2,"Minimun 2 candidates are required for voting");
        require(_voterId==votersDetails[_voterId].voterId,"Invalid Voter ID");
        require(_CandId==candidatesDetails[_CandId].candidateId,"Invalid Candidate ID");
        require(votersDetails[_voterId].voteCandidateId==_CandId,"You have already voted");
        require(stopVoting==false,"Voting is stopped");
        votersDetails[_voterId].voteCandidateId=_CandId;
        candidatesDetails[_CandId].votes++;
    }

    function voteTime(uint _startTime, uint _duration) external onlyCommisioner{
        startTime=_startTime;
        endTime=_startTime+_duration;
    }

    function votingStatus() public view returns(string memory){
        if(startTime==0){
            return "Voting has not started";
        }
        else if(endTime>block.timestamp && stopVoting!=true){
            return "Voting is going on";
        }
        else{
            return "Voting has started";
        }
    }

    function result() external onlyCommisioner{
        uint max=0;
        for(uint i=1;i<nextCandidateId;i++){
            if(candidatesDetails[i].votes>max){
                max=candidatesDetails[i].votes;
                winner=candidatesDetails[i].candidateAddress;
            }
        }
    }

    function emergencyCall() external onlyCommisioner{
        stopVoting=true;
    }
}