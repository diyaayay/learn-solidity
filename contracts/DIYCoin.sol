// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

// understanding basics of ERC-20
contract DIYCoin {
    address public owner;
    string public name = "DoDoCoin";
    string public symbol = "DODO";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call");
        _;
    }

    function balanceOf(address account) public view returns (uint) {
        return balances[account];
    }

    function transfer(address recipient, uint amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint amount) public returns (bool) {
        require(balances[from] >= amount, "Insufficient balance");
        require(allowance[from][msg.sender] >= amount, "Insufficient allowance");

        balances[from] -= amount;
        balances[to] += amount;
        allowance[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        return true;
    }

    function mint(uint amount) public onlyOwner returns (bool) {
        balances[owner] += amount;
        totalSupply += amount;
        emit Transfer(address(0), owner, amount);
        return true;
    }

    function mintTo(address to, uint amount) public onlyOwner returns (bool) {
        balances[to] += amount;
        totalSupply += amount;
        emit Transfer(address(0), to, amount);
        return true;
    }

    function burn(uint amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance to burn");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
        return true;
    }
}
