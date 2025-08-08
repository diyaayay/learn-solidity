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

## 3. contracts/DIYCoinErc.sol

An ERC-20 compliant token contract named **DoDoCoin** (`DODO`) that supports minting.

### Features

- Implements ERC-20 standard using OpenZeppelin's library.
- Owner-only `mintTo(address, amount)` function to mint new tokens.
- Initial supply of `1,000,000,000` tokens minted to the contract deployer.
- Uses OpenZeppelin’s `Ownable` to restrict minting access to the owner.

## 4. projects/Foundry/MyTokenERC20

An ERC-20 token contract named **MyToken** (`MTK`) with minting support and Foundry tests.


### Features


- Implements the ERC-20 standard using OpenZeppelin’s `ERC20` implementation.
- `mint(address to, uint256 amount)` function allows minting tokens to any address.
- Includes Foundry tests covering:
  - Minting to different addresses.
  - Transfers between accounts.
  - ERC-20 allowance and `transferFrom` behavior.
  - Revert cases for insufficient allowances and balances.
