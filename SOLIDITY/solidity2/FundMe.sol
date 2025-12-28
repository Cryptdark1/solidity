// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v"


contract FundMe{
    uint256 public minimumUsd = 50 * 5e18;
    
    address[] public funders;
    mapping ( address funder => uint256 amountFunded) public addressToAmountFunded;
    function fund() public payable{
        //Allow users to send $
        // have a minimum $ sent
        // 1. how do we send eth to this contract?
        require(getConversionRate (msg.value )> minimumUsd, "didnt send enough eth");// 1e18 = 1eth 
        // what is a revert?
        // undo any actions that have been done, and send the remaining gas back
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
    //function withdraw() public{}
    function getPrice() public view returns( uint256){
        //Address 
        //ABI
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x94838475783938933983938383);
        (, int256 price ,,,) = pricefeed.latestRoundData();
        //price of eth in terms of usd
        //200.00000000
        return uint256(price * 1e10);
    }
    function getConversionRate( uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd;
    }
    function getversion() public returns (uint256){
        return AggregatorV3Interface(0x94838475783938933983938383)
    }
}