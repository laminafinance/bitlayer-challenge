// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {AccessControl} from "src/AccessControl.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        AccessControl accessControl = new AccessControl();
        console.log("deployed AccessControl to: ", address(accessControl));
        vm.stopBroadcast();
    }
}
