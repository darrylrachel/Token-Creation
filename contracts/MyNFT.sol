// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // Setting the Solidity version

// Import the ERC721 contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Import the Ownable contract from OpenZeppelin
import "@openzeppelin/contracts/access/Ownable.sol";

// Define a new contract called MyNFT that uses ERC721 for NFTs and Ownable for ownership
contract MyNFT is ERC721, Ownable {

  // Variable to keep track of the number of tokens created
  uint256 public tokenCounter;

  // Constructor function to initialize the contract with a name and symbol for the NFT
  constructor() ERC721("MyNFT", "MNFT") {
    tokenCounter = 0;
  }

  // Function to create a new token, only the owner can call this function
  function createToken() public onlyOwner returns (uint256) {
    uint256 newTokenId = tokenCounter;
    _safeMint(msg.sender, newTokenId);
    tokenCounter += 1;
    return newTokenId;
  }

  // Function to destroy a token, only the owner can call this function
  function burnToken(uint256 tokenId) public onlyOwner {
    _burn(tokenId);
  }

}