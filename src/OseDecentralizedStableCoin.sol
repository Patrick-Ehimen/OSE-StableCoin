// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {ERC20, ERC20Burnable} from '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol'
import {Ownable} from '@openzeppelin/contracts/access/Ownable.sol'

/// @title A decentralized stablecoin
/// @author 0xOse
/// @notice This is the contract meant to be owned by ODSCEngine. It is a ERC20 token that can be minted and burned by the ODSCEngine smart contract
/// collateral: wBTC & wETH
//  minting: Algorithmetic
//  relative stablity: Pegged to USD

contract DarthDecentralizedStableCoin is ERC20Burnable, Ownable {
    error DarthDecentralizedStableCoin_AmountMustBeMoreThanZero();
    error DarthDecentralizedStableCoin_BurnAmountExceedsBalance();
    error DarthDecentralizedStableCoin_NotZeroAddress();

    constructor() ERC20('Darth', 'DAT') {}

    function burn(uint256 _amountToBurn) public override onlyOwner{
        uint256 balance = balanceOf(msg.sender);
        if(_amountToBurn <= 0) {
            revert DarthDecentralizedStableCoin_AmountMustBeMoreThanZero();
        } 
        if(_amountToBurn < 0) {
            revert DarthDecentralizedStableCoin_BurnAmountExceedsBalance();
        }
        super.burn(_amountToBurn);
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if(_to == 0) {
            revert DarthDecentralizedStableCoin_NotZeroAddress();
        }
        if(_amount <= 0) {
            revert DarthDecentralizedStableCoin_AmountMustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
