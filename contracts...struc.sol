pragma solidity 0.8.7;

contract TestingStruct{
    
    uint transferID = 1;
    uint approvalMinimum = 2;
    
    struct Struct1{
        uint tID;
        address sender;
        address receiver;
        uint amount;
        uint approvalCount;
    }
    
    mapping(uint => Struct1) transfersAvailable;
    
    function initiateTransfer(uint _amount, address _receiver) public {
        transfersAvailable[transferID].tID = transferID;
        transfersAvailable[transferID].amount = _amount;
        transfersAvailable[transferID].receiver = _receiver;
        transfersAvailable[transferID].sender = msg.sender;
        transfersAvailable[transferID].approvalCount += 1;
        
        transferID += 1;
    }
    
    function getTransferInfo(uint _transferID) public view returns (uint, address, address, uint, uint){
        return (transfersAvailable[_transferID].tID, transfersAvailable[_transferID].sender, transfersAvailable[_transferID].receiver, transfersAvailable[_transferID].amount, transfersAvailable[_transferID].approvalCount);
    }
    
    function approveTransferRequest(uint _transferID) public /*OnlyOwner*/{
        transfersAvailable[_transferID].approvalCount += 1;
        
        /*if(transfersAvailable[_transferID].approvalCount = approvalMinimum){
            execute the original transfer request;
        }*/
    }
    
}