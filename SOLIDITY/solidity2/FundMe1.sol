// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {priceConverter} from "./priceConverter.sol";


contract FundMe{
    using priceConverter for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18;
    
    address[] public funders;
    mapping ( address funder => uint256 amountFunded) public addressToAmountFunded;

    address public immutable i_owner ;

    error NotOwner();
    constructor() {
        i_owner = msg.sender;
    }
    function fund() public payable{
       
        require(msg.value.getConversionRate()=> MINIMUM_USD, "didnt send enough eth");// 1e18 = 1eth 
        // what is a revert?
        // undo any actions that have been done, and send the remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
    function withdraw() public onlyOwner{
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[fundersIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        // withdraw the funds

        //transfer
      //  payable(msg.sender).transfer(address(this).balance);
        //send
        //call
       // bool sendSucess = payable(msg.sender).send(address(this).balance);
       // require(sendSucess, "send failed");

        (bool callSucess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess, "call failed");
        
        modifier onlyOwner() {
          //  require(msg.sender == i_owner, "sender must be owner!");
          if (msg.sender != i_owner){revert NotOwner();}
            _;
        }
        //what happens if someone sends this contract eth without calling the fund function

        receive() external payable{
            fund();
        }
        fallback() external payable{
            fund();
        }
    }

   
}