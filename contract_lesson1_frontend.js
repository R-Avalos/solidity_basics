// Contract front end

// Vue.js used to swap out images and apply CSS filters
// Setup application binary interface variable
var abi = /* abi generated by the compiler */
var ZombieFactoryContract = web3.eth.contract(abi)
var contractAddress = /* contract address on Ethereum */
var ZombieFactory= ZombieFactoryContract.at(contractAddress) /* ZombieFactory has access to contract's public functions */


// event listener to take text input:
$("#textButton").click(function(e) {
	var name = $("#nameInput").val()
	// Call contract's 'createRandomZombie' function:
	ZombieFactory.createRandomZombie(name)
})

// listen for 'NewZombie' event, and update UI
var event = ZombieFactory.NewZombie(function(error, result) {
	if (error) return
		generateZombie(result.zombieId, result.name, result.dna)
})

// update content/image based on zombie dna
function generateZombie(id, name, dna) {
	let dnaStr = String(dna)
	// pad DNA with leading zeroes if it's less than 16 characters
	while(dnaStr.length<16)
		dnaStr = "0" + dnaStr

	let zombieDetails = {
		// head is based off first 2 digits
		// 7 possible heads, module 7 to get numbers 0-6
		// add 1 to make it 1 through 7
		// load image files "head1.png" through "head7.png"
		headChoice: dnaStr.substring(0, 2) % 7 + 1,
		// next 2 digits define eyes, with 11 variations
		eyeChoice: dnaStr.substring(2, 4) % 11 + 1,
		// next 6 digits control color, using CSS filter: hue-rotate. 360 degrees of choice
		skinColorChoice: parseInt(dnaStr.substring(6,8) / 100 * 360),
		eyeColorChoice: parseInt(dnaStr.substring(8, 10) / 100 * 360),
		clothesColorChoice: parseInt(dnaStr.substring(10, 12) / 100 * 360),
		zombieName: name,
		zombieDescription: "Level 1 CryptoZombie",
	}
	return zombieDetails
}

// Hipster Zombie: https://share.cryptozombies.io/en/lesson/1/share/Hipster?id=Z29vZ2xlLW9hdXRoMnwxMDU3NTI0NjQyMDQxNDcwNDcwNjE%3D