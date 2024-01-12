// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title A decentralized stablecoin
/// @author 0xOse (https://www.linkedin.com/in/patrick-ehimen/)
/// @dev A decentralized stablecoin contract
/// @notice This is the contract meant to be owned by ODSCEngine. It is a ERC20 token that can be minted and burned by the ODSCEngine smart contract
/// collateral: wBTC & wETH
//  minting: Algorithmetic
//  relative stablity: Pegged to USD
contract DartDecentralizedStableCoin is ERC20Burnable, Ownable {
    error DartDecentralizedStableCoin_AmountMustBeMoreThanZero();
    error DartDecentralizedStableCoin_BurnAmountExceedsBalance();
    error DartDecentralizedStableCoin_NotZeroAddress();

    constructor() ERC20("Darth Stablecoin", "DAT") {}

    /**
     * @dev Burns a specific amount of tokens.
     * @param _amountToBurn The amount of tokens to be burned.
     */
    function burn(uint256 _amountToBurn) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amountToBurn <= 0) {
            revert DartDecentralizedStableCoin_AmountMustBeMoreThanZero();
        }
        if (balance < 0) {
            revert DartDecentralizedStableCoin_BurnAmountExceedsBalance();
        }
        super.burn(_amountToBurn);
    }

    /**
     * @dev Mints a specific amount of tokens and assigns them to an address.
     * @param _to The address to which the tokens will be minted.
     * @param _amount The amount of tokens to be minted.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DartDecentralizedStableCoin_NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DartDecentralizedStableCoin_AmountMustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
