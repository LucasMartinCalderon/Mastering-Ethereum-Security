pragma solidity >= 0.7.0 < 0.9.0

contract Victim_bank {
	mapping(address => bool) bonus;
	mapping(address => unit256) reward; 
	// rest of the code goes here
	
	function get_bonus_withdraw() {
		require(!bonus[msg.sender]); 
		reward[msg.sender] += 10; // 10 gwei is the default unit of price in EVMSC
		withdraw_all(msg.sender); 
		bonus[msg.sender] = true; 
	} 

	function withdraw_all() {
		unit256 amount = reward[msg.sender]; // the value of amount is copied by value, not reference. The latter will not incur 
						    //  this sharing-variable reentrancy vulnerability. 
		reward[msg.sender] = 0; 
		require(msg.sender.call.value(amount)()); 
	} 

}



