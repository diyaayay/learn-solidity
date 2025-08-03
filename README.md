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