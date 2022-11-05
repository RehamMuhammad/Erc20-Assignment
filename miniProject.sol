// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//importing our interface in our contract
import "./interface.sol";

//inherits from IERC20interface
contract ERC20 is IERC20 {

        
        uint public override totalSupply;//state variable

        //mapping every wallet address to its balance to get  the account's balance
        mapping(address => uint)public override balanceOf;

        //nested mapping to allow another one to spend from your wallet
        mapping(address => mapping(address => uint)) public override allowance;
        
        //the name of our token
        string public name = "tech4dev Token";

        //the symbol of our token
        string public symbol = "T4D Token";

        //the decimal indicates how divisible the token can be
        uint public decimals = 18;

        // this fn. is to transfer an amount from an address to aother
        function transfer(address recipient, uint amount)external override returns(bool){
        balanceOf[msg.sender]-= amount; //transferring the amount from the sender address
        balanceOf[recipient] += amount; //transferring the amount to the recipient address
        emit Transfer(msg.sender, recipient, amount); // emit is to broadcast the Transfer event
        return true; //this line would be executed if all the previous lines have been executed successfully
        }


        // this fn. is to give an approval to the spender in order to spend a specific amount
        function approve(address spender, uint amount)external override returns(bool){
        allowance[msg.sender][spender] = amount; //the allowance fn. would be executed first 
        emit Approval(msg.sender, spender, amount);// emit is to broadcast the Approval event
        return true;//this line would be executed if all the previous lines have been executed successfully
        }


        //to enable the tokens to be transferred from the sender (it's usually called by the recipient)
        function transferFrom(address sender,address recipient, uint amount) external override returns (bool){
            allowance[sender][msg.sender] -= amount; //the allowance fn. would be executed first
            balanceOf[sender] -= amount; //transferring the amount from the sender address
            balanceOf[recipient] += amount; //transferring the amount to the recipient address
            emit Transfer(sender, recipient, amount); // emit is to broadcast the Transfer event
            return true;//this line would be executed if all the previous lines have been executed successfully
        }


        //mint means creation of more tokens
        function mint(uint amount) external {
            balanceOf[msg.sender] += amount; //Adding the amount to the sender address
            totalSupply += amount; //increasing the total supply
            emit Transfer(address(0), msg.sender, amount); // emit is to broadcast the Transfer event from an unknown address 
        }


        //this fn. is used to destroy tokens
        function burn(uint amount) external {
            balanceOf[msg.sender] -= amount; //decreasing the amount from the sender address
            totalSupply -= amount;//decreasing the total supply
            emit Transfer(msg.sender, address(0), amount); // emit is to broadcast the Transfer event from an unknown address      
        }
}