pragma solidity >=0.7.0 <0.9.0;

contract Bank {

    mapping(address => uint256) user_balance; 

    /**
     * deposit bank function
     */
     function deposit() payable {
         user_balance[msg.sender] += msg.value; 
     }


    /**
    * withdraw function, vulnerable to reentrancy attack
     */
     function withdraw() public {
         uint256 amount = user_balance[msg.sender]; 
         // call.value() function will end in a fallback function being executed, which can be abused by an Attacker contract
         require(msg.sender.call.value(amount)); 
         user_balance[msg.sender] = 0
     }
}
