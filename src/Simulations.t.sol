// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.6;

import "ds-test/test.sol";

import {CERC20} from "./fuse/CERC20.sol";
import {CEther} from "./fuse/CEther.sol";
import {Comptroller} from "./fuse/Comptroller.sol";

import {Lens} from "./fuse/Lens.sol";

contract Simulations is DSTest {
    Lens lens;

    Comptroller comptroller;

    CERC20 usdc;
    CERC20 dai;

    function setUp() public {
        // Global Fuse Lens.
        lens = Lens(0x8dA38681826f4ABBe089643D2B3fE4C6e4730493);

        // Fuse Pool 3
        comptroller = Comptroller(0x6E7fb6c5865e8533D5ED31b6d43fD95f4C411834);

        // Pool 3 USDC
        usdc = CERC20(0x94C49563a3950424a2a7790c3eF5458A2A359C7e);

        // Pool 3 DAI
        dai = CERC20(0xCF90552eC3Db6143C83385FdD7bC96ef40F7ee44);
    }

    function testLogMarket() public {
        (Lens.FusePoolUser[] memory preUsers, , ) = lens.getPoolUsersWithData(address(comptroller), 1e18);
        emit log_named_uint("Pre-Liquidatable Users", preUsers.length);

        emit log_named_uint("Set DAI CF", comptroller._setCollateralFactor(address(dai), 0.5e18));
        emit log_named_uint("Set USDC CF", comptroller._setCollateralFactor(address(usdc), 0.5e18));

        (Lens.FusePoolUser[] memory postUsers, , ) = lens.getPoolUsersWithData(address(comptroller), 1e18);
        emit log_named_uint("Post-Liquidatable Users", postUsers.length);
    }
}
