# OptimismStorage dApp

A decentralized application for interacting with a simple storage contract on the Optimism network.

![OptimismStorage Interface](https://api.placeholder.com/400/320?text=OptimismStorage+Interface)

## Overview

This project demonstrates a basic interaction pattern between a web frontend and a smart contract deployed on the Optimism network. The dApp allows users to:

- View the current stored value
- Update the stored value (owner only)
- View past value update events
- Monitor transaction status

## Smart Contract

The `OptimismStorage` contract is deployed on the Optimism network at address: `0xc52078Cb73880CC1F3A830df3c1d9B1c8Edc0338`

### Contract Features

- Simple storage mechanism for a single uint256 value
- Owner-based access control for value updates
- Event emission for value updates
- View function for retrieving the current value

### Contract Code

```solidity
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
```

### Contract ABI

```json
[
  {"inputs":[{"internalType":"uint256","name":"_initialValue","type":"uint256"}],"stateMutability":"nonpayable","type":"constructor"},
  {"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"newValue","type":"uint256"},{"indexed":true,"internalType":"address","name":"updatedBy","type":"address"}],"name":"ValueUpdated","type":"event"},
  {"inputs":[],"name":"getValue","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},
  {"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},
  {"inputs":[{"internalType":"uint256","name":"_newValue","type":"uint256"}],"name":"setValue","outputs":[],"stateMutability":"nonpayable","type":"function"}
]
```

## Frontend

The frontend is a simple HTML/JavaScript application that uses ethers.js to interact with the Ethereum blockchain and the deployed contract.

### Features

- Connect to MetaMask or other Ethereum wallets
- Display connected account and network information
- Automatic detection of Optimism network with option to switch
- Show contract owner and determine if connected user has owner privileges
- Display and refresh the current stored value
- Allow owner to update the stored value
- Real-time event monitoring
- Display of historical events

### Technologies Used

- HTML5
- CSS3
- JavaScript (ES6+)
- [ethers.js](https://docs.ethers.org/v6/) v6.7.0 - Ethereum library
- MetaMask (or other Web3 provider)

## Getting Started

### Prerequisites

- A modern web browser (Chrome, Firefox, etc.)
- MetaMask or another Ethereum wallet extension installed in your browser
- An account with ETH on the Optimism network (for contract interactions)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/optimism-storage-dapp.git
   cd optimism-storage-dapp
   ```

2. Open the `index.html` file in your browser or serve it using a simple HTTP server:
   ```bash
   # Using Python 3
   python -m http.server
   
   # Or using Node.js
   npx serve
   ```

3. Navigate to the local URL (typically http://localhost:8000 or similar)

### Usage

1. Click "Connect Wallet" to connect your Ethereum wallet
2. If not on the Optimism network, use the "Switch to Optimism" button
3. View the current stored value
4. If you're the contract owner, you can update the value:
   - Enter a new value in the input field
   - Click "Set Value"
   - Confirm the transaction in your wallet
   - Wait for the transaction to be mined

## Optimism Network Information

- **ChainID**: 10 (0xA in hex)
- **RPC URL**: https://mainnet.optimism.io
- **Explorer**: https://optimistic.etherscan.io
- **Currency**: ETH

## Development

### Adding Optimism to MetaMask

If you don't have the Optimism network configured in MetaMask, add a new network with these parameters:

- **Network Name**: Optimism
- **RPC URL**: https://mainnet.optimism.io
- **Chain ID**: 10
- **Currency Symbol**: ETH
- **Block Explorer URL**: https://optimistic.etherscan.io

### Local Development

For local development and testing, consider using:

- Optimism Goerli Testnet
- Hardhat for smart contract development
- [Optimism Box](https://trufflesuite.com/boxes/optimism/) for Truffle

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Acknowledgments

- [Optimism](https://www.optimism.io/) - Layer 2 scaling solution for Ethereum
- [ethers.js](https://docs.ethers.org/v6/) - Complete Ethereum library
- [MetaMask](https://metamask.io/) - Crypto wallet & gateway to blockchain apps