// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DIYCoin is ERC20, Ownable {
    constructor() ERC20("DoDoCoin", "DODO") Ownable(msg.sender){
        _mint(msg.sender, 1000000000);
    }

    function mintTo(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }
}
