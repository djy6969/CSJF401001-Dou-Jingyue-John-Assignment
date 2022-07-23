// SPDX-License-Identifier: MIT
pragma solidity >=0.4.20 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;


  modifier restricted() {
    if (msg.sender ==owner) _;
  }

//  modifier restricted() {
//    require(
//      msg.sender == owner,
//      "This function is restricted to the contract's owner"
//    );
//    _;
//  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
