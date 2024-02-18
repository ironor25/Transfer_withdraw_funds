//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract mathtester{
  uint8 public bign = 255; //unchecked 
//bcz you have reached the uint8 limit.
//in version >=0.8 it checks underflow and overflow and give error.
// suppose if we add +1 then overflow gives error.  

//so in SAFE MATH 
  function add() public {
    unchecked {bign += 1;}
    //THIS BASICALLY MAKING IT GAS EFFICIENT 
    //bcz it will check before failing the transaction.

  }
}