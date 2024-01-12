// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {ERC20, ERC20Burnable} from '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol'

/// @title A decentralized stablecoin
/// @author 0xOse
/// @notice This is the contract meant to be owned by ODSCEngine. It is a ERC20 token that can be minted and burned by the ODSCEngine smart contract
/// collateral: wBTC & wETH
//  minting: Algorithmetic
//  relative stablity: Pegged to USD

contract OseDecentralizedStableCoin is ERC20Burnable{
    constructor() {}
}