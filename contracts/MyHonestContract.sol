//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//1. update your state variable before making call to another contract
//2. using a modifier | only one funtion is executed at a time

contract MyHonestContract {
    mapping(address => uint256) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    bool internal locked;

    modifier noReentrant() {
        require(!locked, "no re-entrancy");
        locked = true;
        _;
        locked = false;
    }

    function withdrawl(uint256 _amount) public noReentrant {
        require(balances[msg.sender] >= _amount);

        balances[msg.sender] -= _amount; // updating the balance before sending ether

        (bool sent, ) = msg.sender.call{value: _amount}("");

        require(sent, "Failed to send ether");

        // balances[msg.sender] -= _amount; this goes above before calling msg.sender.call
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
