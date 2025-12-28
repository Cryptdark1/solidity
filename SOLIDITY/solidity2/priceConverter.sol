// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v"

library priceConverter {
     function getPrice() internal view returns( uint256){
        //Address 
        //ABI
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x94838475783938933983938383);
        (, int256 price ,,,) = pricefeed.latestRoundData();
        //price of eth in terms of usd
        //200.00000000
        return uint256(price * 1e10);
    }
    fumction getConversionRate( uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd;
    }
    function getversion() internal returns (uint256){
        return AggregatorV3Interface(0x94838475783938933983938383)
    }
}