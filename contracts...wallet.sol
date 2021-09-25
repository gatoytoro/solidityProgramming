pragma solidity 0.8.7;

contract Wallet{
    
    address owner; //contract deployer
    address owner1;
    address  owner2;
    address  owner3;
    uint  approvalMinimum;
    uint walletBalance;
    uint transferID;
    
    struct TransferStruct{
        uint tID;
        address sender;
        address receiver;
        uint amount;
        uint approvalCount;
    }

    mapping(uint => TransferStruct) transfersAvailable;
    
    constructor(address _owner1, address _owner2, address _owner3, uint _approvers){
        owner = msg.sender; // the person deploying the contract becomes the owner dynamically
        owner1 = _owner1;
        owner2 = _owner2;
        owner3 = _owner3;
        approvalMinimum = _approvers;
        walletBalance = 0;
        transferID = 1;
    }
    
    modifier onlyOwner{
        require(msg.sender == owner1 || msg.sender == owner2 || msg.sender == owner3);
        _; //run the fn
    }
 
    //mapping(address => uint) Balance;
    
    function addBalance(uint _addAmount) external payable { //to be external for anyone who wants to add $
        require(msg.sender.balance >= _addAmount);
        walletBalance += _addAmount;
    }
    
    function getWalletBalance() public view onlyOwner returns(uint){
        return walletBalance;
    }
    
    function initiateTransfer(uint _amount, address payable to) public onlyOwner{
        require(walletBalance >= _amount);
        require(msg.sender != to);

        transfersAvailable[transferID].tID = transferID;
        transfersAvailable[transferID].amount = _amount;
        transfersAvailable[transferID].receiver = to;
        transfersAvailable[transferID].sender = msg.sender;
        transfersAvailable[transferID].approvalCount += 1;
        
        transferID += 1;
        
    }
    
    function getTransferInfo(uint _transferID) public view onlyOwner returns (uint, address, address, uint, uint){
        return (transfersAvailable[_transferID].tID, transfersAvailable[_transferID].sender, transfersAvailable[_transferID].receiver, transfersAvailable[_transferID].amount, transfersAvailable[_transferID].approvalCount);
    }
    
    function approveTransferRequest(uint _transferID) public onlyOwner {
        transfersAvailable[_transferID].approvalCount += 1;
        
        if(transfersAvailable[_transferID].approvalCount = approvalMinimum){
            _transfer(transfersAvailable[_transferID].amount, transfersAvailable[_transferID].receiver);
        }
    }
    
    function _transfer(uint _amount2, address _addr) private {
        address payable toSend = _addr;
        toSend.transfer(_amount2);  
    }


}

