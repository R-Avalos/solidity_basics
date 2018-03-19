pragma solidity ^0.4.19; // Declare Solidity version here

// Create contract below 

// Create method to assign attributes to zombie types
contract ZombieFactory {
	// Create events
	event NewZombie(uint zombieId, string name, uint dna);  // fires event everytime a new zombie is created with id, name, and dna


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

// Functions
// Creates a Zombie using the function parameters and pushes into an array
// Delcare it private so that no outside calls can push to the array
	function _createZombie(string _name, uint _dna) private {
        	uint id = zombies.push(Zombie(_name, _dna)) - 1; // get the array number of the zombie that was just pushed, -1 as the array starts at 0
	        NewZombie(_zombieId, _name, _dna); // fires event for front end listener with each addition to array 
	}

// create a function that returns an integer, this will not modify data, simply read only (view), for random generation
	function _generateRandomDna (string _str) private view returns(uint) {
		uint rand = uint(keccak256(_str));  // create rand uint, type cast hash of _str into uint
        return rand % dnaModulus;  // return the modulus of rand by dnaModulus
	}
// create a function that create a random Zombie, using the random  generator function above
// note how this a public function, and _beforefunction is removed
    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}


