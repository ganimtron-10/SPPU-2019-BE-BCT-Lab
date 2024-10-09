/*
Aledutron
SPPU 2019 BE BCT Lab
SPPU Computer Engineering Fourth Year (BE) Blockchain Technology (BCT) Lab Assignments (2019 Pattern)
Youtube BCT Lab Playlist Link: https://www.youtube.com/playlist?list=PLlShVH4JA0ovKDnK-4vNfdlz2f1mfUntP

Problem Statement:
Q3.sol
Write a smart contract on a test network, for Bank account of a customer for following 
operations:
- Deposit money 
- Withdraw Money
- Show balance

Explaination Video Link: https://www.youtube.com/watch?v=kW6G4nxA0VY&list=PLlShVH4JA0ovKDnK-4vNfdlz2f1mfUntP&index=2&pp=iAQB
*/

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank{
    // dtype acessSpecifier varName (= value);
    // address public accHolder;
    // uint balance = 0;

    mapping(address => uint) balanceOf;

    // constructor(){
    //     accHolder = msg.sender;
    // }

    // function functionName(param) accessSpecifier returns(returnType) {
    //     body;
    // }

    // function createAccount() public payable {
    //     require(msg.value == 1 ether, "Not enough fee to create an account.");
    //     balanceOf[msg.sender] = -1;
    // }

    function deposit() public payable {
        require(msg.value > 0, "Deposit should be greater than zero.");
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balanceOf[msg.sender] > 0, "Your balance should be greater than zero.");
        payable(msg.sender).transfer(balanceOf[msg.sender]);
        balanceOf[msg.sender] = 0;
    }

    function showBalance() public view returns(uint) {
        return balanceOf[msg.sender];
    }

}
