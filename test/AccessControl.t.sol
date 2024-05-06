// SPDX-License-Identifier: NONE
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AccessControl} from "src/AccessControl.sol";

contract AccessControlTest is Test {
    address internal constant _SIGNER = address(bytes20(bytes32(keccak256("defaultSigner"))));
    address internal constant _SIGNER1 = address(bytes20(bytes32(keccak256("user1"))));
    address internal constant _SIGNER2 = address(bytes20(bytes32(keccak256("user2"))));
    AccessControl public accessControl;
    address sender;

    function setUp() public {
        vm.prank(_SIGNER);
        accessControl = new AccessControl();
    }

    function test_addAdmin() public {
        // test with non-admin
        vm.expectRevert();
        accessControl.addAdmin(_SIGNER1);

        // test with admin
        vm.prank(_SIGNER);
        accessControl.addAdmin(_SIGNER1);

        // validate result
        require(accessControl.admin(_SIGNER1));
    }

    function test_removeAdmin() public {
         // add admin
        vm.prank(_SIGNER);
        accessControl.addAdmin(_SIGNER1);

        // test with non-admin
        vm.expectRevert();
        accessControl.removeAdmin(_SIGNER1);

        // test with admin
        vm.prank(_SIGNER);
        accessControl.removeAdmin(_SIGNER1);

        // validate result
        require(!accessControl.admin(_SIGNER1));
    }

    function test_secure_function() public {
        // test with non-admin
        vm.startPrank(_SIGNER1);
        vm.expectRevert();
        accessControl.secureFunction(500);
        vm.stopPrank();

        // test with admin
        vm.prank(_SIGNER);
        accessControl.secureFunction(500);

        // validate result
        require(accessControl.salt() == 500);
    }
}
