// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OptimismStorage {
    address public immutable owner;
    uint256 private storedValue;
    
    event ValueUpdated(uint256 newValue, address indexed updatedBy);

    constructor(uint256 _initialValue) {
        owner = msg.sender;
        storedValue = _initialValue;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setValue(uint256 _newValue) external onlyOwner {
        storedValue = _newValue;
        emit ValueUpdated(_newValue, msg.sender);
    }

    function getValue() external view returns (uint256) {
        return storedValue;
    }
}