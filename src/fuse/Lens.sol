// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.6;

interface Lens {
    struct FusePoolUser {
        address account;
        uint256 totalBorrow;
        uint256 totalCollateral;
        uint256 health;
    }

    function getPoolUsersWithData(address comptroller, uint256 maxHealth)
        external
        returns (
            FusePoolUser[] memory,
            uint256,
            uint256
        );
}
