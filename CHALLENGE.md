# Coding Challenge: Smart Contract with Access Control on Bitlayer Testnet

## Summary

Create a Solidity smart contract that implements simple access control using function modifiers. This contract should have various functions that are protected by an `onlyAdmin` modifier, ensuring that only designated administrators can execute certain actions.

## Requirements

1. Access Control:

   - Implement an `onlyAdmin` modifier.
   - The contract should have an admin role that is assigned upon contract deployment.
   - Include functions to add and remove other admins, protected by the `onlyAdmin` modifier.

2. Functionality:

   - Include a sample set of functions that simulate business logic (e.g., modifying a state variable) which should only be accessible to admins.

3. Deployment:

   - Deploy the contract on the Bitlayer testnet.

## Resources

- Solidity Documentation: https://docs.soliditylang.org/en/v0.8.4/
- Bitlayer Docs: https://docs.bitlayer.org/

## Development Tools

You can use any of these tools based on your preference:
- Hardhat
- Truffle
- Brownie
- Solidity

## Task Details

1. Contract Code:
  Write a Solidity contract with the specified access control features. Here's a basic outline:

  ```solidity
  // SPDX-License-Identifier: MIT
  pragma solidity ^0.8.4;

  contract AccessControl {
      address public admin;

      constructor() {
          admin = msg.sender;
      }

      modifier onlyAdmin() {
          require(msg.sender == admin, "Only admin can perform this action");
          _;
      }

      function addAdmin(address newAdmin) public onlyAdmin {
          // logic to add new admin
      }

      function removeAdmin(address adminToRemove) public onlyAdmin {
          // logic to remove an admin
      }

      function secureFunction() public onlyAdmin {
          // business logic only accessible to admins
      }
  }
  ```

1. Tests:
Write Solidity tests to ensure all functions work correctly, particularly the access controls.
2. Deployment:
Deploy the contract on the Bitlayer testnet. Record the deployed address.
3. Interact with the Contract:
Create a script using Ethers.js, Web3.js, or similar library to interact with the deployed contract, querying and invoking its functions.

### Bonus

- Verify the Contract on Bitlayer Explorer: Provide a guide or script for verifying the deployed contract on the Bitlayer blockchain explorer.