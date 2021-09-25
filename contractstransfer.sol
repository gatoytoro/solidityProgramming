pragma solidity 0.8.7;

contract TestingTransfer{
    
    uint approvalCount = 1;
    uint approvalMinimum = 2;
    uint originalAmount;
    address payable originalReceiver;
    
    constructor(address payable _oRec/*, uint _oA*/){
        originalReceiver = _oRec;
        //originalAmount = _oA;
    }

    function approveTransferRequest() public payable {
        approvalCount += 1;
        
        if(approvalCount >= approvalMinimum){
            //_transfer(transfersAvailable[_transferID].amount, transfersAvailable[_transferID].receiver);
            //originalReceiver.transfer(msg.value);
            uint amount = 1000000000000000000;
            (bool success,  ) = originalReceiver.call{value: amount}("");
            require(success, "Failed to transfer the funds, aborting.");
        }
    }
    
    /*function _transfer(uint, address) private {
        address payable toSend = _addr;
        toSend.transfer(_amount2);  
    }*/
    
}
