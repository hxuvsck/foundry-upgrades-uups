// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Upgradeable contracts are on different repo
import {UUPSUpgradeable} from "@openzeppelin-contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin-contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin-contracts-upgradeable/proxy/utils/Initializable.sol";

contract BoxV2 is UUPSUpgradeable, Initializable, OwnableUpgradeable {
    // If we change the storage variable index, we will mess it up
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
        // we can't use constructor to state some variable into storage such as
        // owner = msg.sender; etc...
        //instead we making this into the function initializer below
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender); // sets owner to: owner = msg.sender from access of upgrade for proxy scs.
    }

    function setNumber(uint256 _number) external {}

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 2;
    }
    function _authorizeUpgrade(address newImplementation) internal override {}
}
