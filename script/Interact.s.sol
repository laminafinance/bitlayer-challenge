// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {AccessControl} from "src/AccessControl.sol";

contract TestInteract is Script {
    function setUp() public {}

    function run() public {
        //address accessControlContract = 0x502Cd4D3Ac40EE0E87B1d1dC4579198B9Ba62116; // deployed via script (verification does not work for singe-file JSON deployment currently)
        address accessControlContract = 0x78a02fC3E0aaF8Fe95B63f7025e39bdFd51251de; // deployed via remix 

        (address signer, uint256 signerPk) = makeAddrAndKey("new signer");
        bool success;
        bytes memory result;
        bytes memory payload;

        console.log("execute with deployer: ", msg.sender);
        vm.startBroadcast();
        AccessControl(accessControlContract).addAdmin(signer);
        AccessControl(accessControlContract).removeAdmin(signer);
        AccessControl(accessControlContract).secureFunction(55);
        AccessControl(accessControlContract).salt();
        console.logBytes(result);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("admin(address)", signer));
        console.logBytes(result);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("addAdmin(address)", signer));
        vm.stopBroadcast();

        console.log("execute with admin: ", signer);
        vm.startBroadcast(signerPk);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("addAdmin(address)", signer));
        console.log("execute with admin - addAdmin:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("removeAdmin(address)", signer));
        console.log("execute with admin - removeAdmin:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("secureFunction(uint256)", 22));
        console.log("execute with admin - secureFunction:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("salt()"));
        console.logBytes(result);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("admin(address)", signer));
        console.logBytes(result);
        vm.stopBroadcast();
    }
}