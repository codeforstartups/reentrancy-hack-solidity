//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyHonestContract {
    mapping(address => uint256) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawl(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send ether");

        balances[msg.sender] -= _amount;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
