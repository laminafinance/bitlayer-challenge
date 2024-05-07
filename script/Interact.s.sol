// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {AccessControl} from "src/AccessControl.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        address accessControlContract = 0x502Cd4D3Ac40EE0E87B1d1dC4579198B9Ba62116;
        (address signer, uint256 signerPk) = makeAddrAndKey("new signer");
        bool success;
        bytes memory result;
        bytes memory payload;

        console.log("execute with deployer: ", msg.sender);
        vm.startBroadcast();
        (success, result) = accessControlContract.call(abi.encodeWithSignature("addAdmin(address)", signer));
        console.log("execute with deployer - addAdmin:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("removeAdmin(address)", signer));
        console.log("execute with deployer - removeAdmin:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("secureFunction(uint256)", 55));
        console.log("execute with deployer - secureFunction:", success);
        (success, result) = accessControlContract.call(abi.encodeWithSignature("salt()"));
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