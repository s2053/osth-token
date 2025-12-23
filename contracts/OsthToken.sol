// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/**
 * @title OsthToken
 * @dev ERC20 token for testing, with minting and optional burning.
 */
contract OsthToken is ERC20 {
    address public owner;

    constructor() ERC20("OsthToken", "OSTH") {
        owner = msg.sender;
        // Initial supply: 100,000 OSTH to deployer
        _mint(msg.sender, 100_000 * 10 ** decimals());
    }

    /**
     * @notice Mint new OSTH tokens to a specified address
     * @param to Recipient address
     * @param amount Number of tokens to mint (in smallest units)
     */
    function mint(address to, uint256 amount) external {
        require(msg.sender == owner, "Only owner can mint");
        _mint(to, amount);
    }

    /**
     * @notice Burn tokens from your own balance
     * @param amount Number of tokens to burn (in smallest units)
     */
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
