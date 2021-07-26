// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.6;

import "ds-test/test.sol";

import {CERC20} from "./fuse/CERC20.sol";
import {CEther} from "./fuse/CEther.sol";
import {Comptroller} from "./fuse/Comptroller.sol";

contract Simulations is DSTest {
    Comptroller comptroller;

    function setUp() public {
        // Fuse Pool 3
        comptroller = Comptroller(0x6E7fb6c5865e8533D5ED31b6d43fD95f4C411834);
    }

    function testLogMarket() public {
        CEther ceth = CEther(payable(comptroller.getAllMarkets()[0]));

        emit log_uint(ceth.reserveFactorMantissa());

        emit log_address(ceth.admin());
        emit log_uint(ceth.adminHasRights() ? 1 : 0);

        emit log_address(address(this));

        emit log_uint(ceth._setReserveFactor(0.69e18));

        emit log_uint(ceth.reserveFactorMantissa());
    }
}
