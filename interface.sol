// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//our interface name 
interface IERC20 {

    //to return the total amount of our token
    function totalSupply()external view returns(uint);

    //to return the current balance of a given account
    function balanceOf(address account) external view returns(uint);

    //to enable the transferring
    function transfer(address recipient, uint amount) external returns(bool); 

    //to allow another one to spend from your wallet
    function allowance(address owner, address spender) external view returns(uint);

    //to give another one to the approval spend from your wallet
    function approve(address sender, uint amount)external returns(bool);

    //to enable the tokens to be transferred from the sender (it's usually called by the recipient)
    function transferFrom(address sender, address recipient, uint amount)external returns(bool);
    
    //Event to transfer an amount from a wallet
    event Transfer(address indexed from, address indexed to, uint amount);

    //Event to approve another one to spend from your wallet
    event Approval(address indexed owner, address indexed spender, uint amount);
    
}
