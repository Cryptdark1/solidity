// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script{
    // if we are on a local avil, we deploy mocks
    // otherwise, grab the existing address from the live network
    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkConfig{
        address priceFeed; // Eth/Usd price feed address
    }
    constructor() {
        if (block.chainid == 11155111){
            activeNetworkConfig = getSepoliaEthConfig();
        }else{
            activeNetworkConfig = getOrCreateAnvilEthConfig();
        }
    }
    function getSepoliaEthConfig() public pure returns (NetworkConfig memory){
       //priceFeed address
       NetworkConfig memory sepoliaConfig = NetworkConfig({
        priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
       });
       return sepoliaConfig;
    }
    function getMainnetEthConfig() public pure returns (NetworkConfig memory){
       //priceFeed address
       NetworkConfig memory ethConfig = NetworkConfig({
        priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
       });
       return ethConfig;
    }
    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory){
        if (activeNetworkConfig.priceFeed != address(0)){
            return activeNetworkConfig;
        }
        //price feed address

        //1. Deploy the mocks 
        //2. Return the mocks 
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({ priceFeed: address(mockPriceFeed)});
        return anvilConfig;
    }
}
