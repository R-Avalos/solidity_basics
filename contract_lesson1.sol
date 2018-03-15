pragma solidity ^0.4.19; // Declare Solidity version here

// Create contract below 

// Create method to assign attributes to zombie types
contract ZombieFactory {
	// create a variable to store on blockchain, uint = unsigned interger == can only be positive (no negative "sign" for unsigned)
	uint dnaDigits = 16;

	// create a uint equal to 10^6, that way we can use it later to shorten an integer to 16 digits.... x = 5**2 = 5^2 = 25
	uint dnaModulus = 10 ** dnaDigits; 

	// Struct type for zombies, as zombies have multiple properties
	struct Zombie {
		string name;
		uint dna;
	}

// Store Zombie types in an array

	// A dynamic, public array of zombie types
	Zombie[] public zombies;

// Function

	function createZombie(string _name, uint _dna){
	        zombies.push(Zombie(_name, _dna));  // Creates a Zombie using the function parameters and pushes into an array
	}

}