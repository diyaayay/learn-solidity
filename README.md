# learn-solidity
## 1. contracts/DeadMansWill.sol

This contract simulates a "Will" that automatically releases funds if the owner becomes inactive for a specified period of time.

### Features

- The owner is the address that deploys the contract.
- A recipient is set during deployment.
- The owner can:
  - Deposit Ether into the contract
  - Change the recipient
  - Call a `ping()` function to prove they are still alive
- If the owner does not call `ping()` within the specified time (`tenYears`), the recipient can trigger `drain()` to claim the balance.

## 2. contracts/DIYCoin.sol

An self implementation of ERC-20 compliant token contract named **DoDoCoin** (`DODO`) that supports minting and burning.

### Features

- Understand ERC-20 basics (transfer, approve, transferFrom, events)
- Owner-only `mint()` and `mintTo()` functions
- Token holders can `burn()` their tokens
- Includes metadata: `name`, `symbol`, `decimals`, and `totalSupply`

## 2. contracts/DIYCoinErc.sol

An ERC-20 compliant token contract named **DoDoCoin** (`DODO`) that supports minting.

### Features

- Implements ERC-20 standard using OpenZeppelin's library.
- Owner-only `mintTo(address, amount)` function to mint new tokens.
- Initial supply of `1,000,000,000` tokens minted to the contract deployer.
- Uses OpenZeppelin’s `Ownable` to restrict minting access to the owner.