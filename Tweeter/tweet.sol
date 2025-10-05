// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract TweeterApplication{
    struct Tweet{
        uint id;
        address author;
        string content;
        uint createdAt;
    }
    struct Message{
        uint id;
        string content;
        address from;
        address to;
        uint createdAt;
    }
    mapping(uint=>Tweet) public tweets;
    mapping(address=>uint[]) public tweetsOf;
    mapping(address=>Message[]) public conversations;
    mapping(address=>mapping(address=>bool)) public operators;
    mapping(address=>address[]) public following;

    uint public nextId;
    uint public messageId;

    function _tweet(address _from, string memory _content) internal  {
        tweets[nextId] =  Tweet(nextId, _from, _content, block.timestamp);
        tweetsOf[_from].push(nextId);
        nextId++;
    }

    function _sendMessage(address _from, address _to, string memory _content) internal  {
        conversations[_from].push(Message(messageId,_content,_from, _to, block.timestamp));
        messageId++;
    }

    function tweet(string memory _content) public { //called by owner
        _tweet(msg.sender, _content);
    }

    function tweet(address _from, string memory _content) public { //called by person who is given acess 
        _tweet(_from, _content);
    }
    function sendMessage(string memory _content,address _to) public {
       _sendMessage(msg.sender, _to, _content);
    }
    function sendMessage(address _from, address _to, string memory _content) public {
       _sendMessage(_from, _to, _content);
    }

    function follow(address _followed) public {
        following[msg.sender].push(_followed);
    }

    function allow(address _operator) public {
        operators[msg.sender][_operator]=true;
    }

    function disAllow(address _operator) public {
        operators[msg.sender][_operator]=false;
    }

    function getLatestTweet(uint count) public view returns(Tweet[] memory) {
        require(count>0 && count<=nextId,"Count is not valid");
        Tweet[] memory _tweets= new Tweet[](count); 

        uint j;
        for(uint i=nextId-count;i<nextId;i++){
            Tweet storage _structure= tweets[j];
            _tweets[j]=Tweet(
            _structure.id,
            _structure.author,
            _structure.content,
            _structure.createdAt);
            j++;
        }
        return _tweets;
    }
}