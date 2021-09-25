# solidityProgramming
In this repo, I will upload all my .sol files

The 'wallet.sol' file is a smart contract multisig wallet project. 

A multisig wallet is a wallet where multiple “signatures” or approvals are needed for an outgoing transfer to take place. 

It has the following features:  

a) Anyone should be able to deposit ether into the smart contract

b) The contract creator should be able to input (1): the addresses of the owners and (2):  the numbers of approvals required for a transfer, in the constructor. For example, input 3 addresses and set the approval limit to 2. 
Anyone of the owners should be able to create a transfer request. The creator of the transfer request will specify what amount and to what address the transfer will be made.

c) Owners should be able to approve transfer requests.

d) When a transfer request has the required approvals, the transfer should be sent. 
