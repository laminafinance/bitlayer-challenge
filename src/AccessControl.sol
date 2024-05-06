// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AccessControl {
    uint256 public salt;
    mapping(address => bool) public admin;

    constructor() {
        admin[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(admin[msg.sender], "Only admin can perform this action");
        _;
    }

    function addAdmin(address newAdmin) public onlyAdmin {
        admin[newAdmin] = true;
    }

    function removeAdmin(address adminToRemove) public onlyAdmin {
        admin[adminToRemove] = false;
    }

    function secureFunction(uint256 value) public onlyAdmin {
        salt = value;
    }
}