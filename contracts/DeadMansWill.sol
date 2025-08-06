// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DeadMansWill{
    address owner;
    address payable recipient;
    uint8 calledCount=0;
    uint tenYears;
    uint public lastVisited;
    constructor(address payable _recipient) payable {
        owner = msg.sender;
        recipient = _recipient;    
        // tenYears= 1 hours * 24 *365*10;
        tenYears = 10;
        lastVisited = block.timestamp;
    }
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }
    modifier onlyReceiver() {
        require(msg.sender == recipient);
        _;
    }

    function deposit()public payable onlyOwner{
        lastVisited=block.timestamp;
    }
    function changeRecipient(address payable rec) public onlyOwner {
        recipient=rec;
        lastVisited=block.timestamp;
    }
    function ping()public onlyOwner{
        lastVisited =block.timestamp;
        
    }
   function drain() external payable onlyReceiver{
    require(lastVisited< block.timestamp - tenYears);
    payable(msg.sender).transfer(address(this).balance);
    }
}