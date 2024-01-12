// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {DartDecentralizedStableCoin} from "./DartDecentralizedStableCoin.sol";

contract DDSCEngine is ReentrancyGuard {
    error DDSCEngine__TokenAddressesAndPriceFeedAddressesAmountsDontMatch();
    error DDSCEngine__NeedsMoreThanZero();
    error DDSCEngine__TokenNotAllowed(address token);
    error DDSCEngine__TransferFailed();
    error DDSCEngine__BreaksHealthFactor(uint256 healthFactorValue);
    error DDSCEngine__MintFailed();
    error DDSCEngine__HealthFactorOk();
    error DDSCEngine__HealthFactorNotImproved();
}
