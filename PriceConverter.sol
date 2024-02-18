//SPDX-License-Identifier: MIT
//its is a kind of library whose programs  will used in other contracts.
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library PriceConverter{
       function getprice() public view returns(uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //abi  
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,) = pricefeed.latestRoundData();
    //above line gives eth price in usd.
    //like 2000.00000000,solidity does not work with decimal.
    return uint256(price * 1e10); //bcz give 8 zeroes so /
    }
    function getconversion(uint256 ethAmount) public view returns(uint256){
            // 1Eth ?
            // 2000_000000000000000000)*1_000000000000000000/1e18;
            uint256 ethprice = getprice();
            uint256 ethAmountusd = (ethprice * ethAmount)/(1e18);
            return ethAmountusd;
    }
    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}