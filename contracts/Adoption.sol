pragma solidity ^0.4.17;

contract Adoption {

//create array of Ethereum Addresses
address[16] public adopters; //homogeneous array with a fixed length of 16 

// Adopting a pet, parameter (int) returns (int)
function adopt(uint petId) public returns (uint) {

    require(petId >= 0 && petId <= 15); //ensure that the petId is within the range of adopters array (starts from 0)

    adopters[petId] = msg.sender; //Add address of the person or smart contract that made the call (denoted by msg.sender) to the adopters array

    return petId; //return an integer (as function specified) as a confirmation
}

function getAdopters() public view returns(address[16]) {
    return adopters;
}

}