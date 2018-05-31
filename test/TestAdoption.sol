pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());


//Testing the adopt() function in the Adoption contract
function testUserCanAdoptPet() public {

    uint returnedId = adoption.adopt(8); //enter the test ID of 8 as a parameter for the adopt() method

    uint expected = 8;

    //perform the unit test
    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
} 

// Testing retrieval of single pet's owner (getter methods are already established!)
function testGetAdopterAddressByPetId() public {
    // Expected owner of this contract
    address expected = this;

    address adopter = adoption.adopters(8); //get the address of owner at position 8 in the adopters array (who owns pet '8')

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded.");
}

// Testing retrieval of pet owners
function testGetAdopterAddressByPetIdInArray() public {
    //Expected owner is this contract
    address expected = this;

    //Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded.");
}

}