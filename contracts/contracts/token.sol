// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Token is ERC20Capped, AccessControl{

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(
            string memory name,
            string memory symbol,
            uint256 cap
    ) ERC20(name, symbol) ERC20Capped(cap) {
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) external {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

}
