//get funds friim users
//withdraw funds
//set a minimum funding value in usd.
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConverter} from "./PriceConverter.sol";

// interface AggregatorV3Interface{
//         function decimals() external view returns (uint8);
//         function description() external view returns (string memory);
//         function version() external view returns (uint256);
//         function getRoundData(uint88 _round)  external view
//         returns (
//             uint80 roundId,
//             int256 answer,
//             uint256 startedAt,
//             uint256 updatedAt,
//              uint80 answeredInRound
//             );
//         function latestRoundData() external view
//         returns (
//             uint80 roundId,
//             int256 answer,
//             uint256 startedAt,
//             uint256 updatedAt,
//              uint80 answeredInRound
//             );

//     }
//this above code is for abi call.
contract FundMe {
    //below line means we are attaching priceconverter to all uint256 values in the below program.
    using PriceConverter for uint256;
    uint256 public m = 1;
    uint256 public n = 2;
    uint256 public minusd = 2e18;
    //task 2 keeping track of who send the money through adress.
    address[] public funders;
    mapping(address => uint256) public addresstofund;

    function fund() public payable {
        //allow users to send $
        //have  a minimum $ sent.
        n += 1;
        m += 2;
        //if below keyword revert the transaction then above no\
        //line of code will execute.
        //  previous  code
        // require(getconversion(msg.value) >= minusd,"didn't send enough eth"); // 1e18 = 10**18
        require(msg.value.getconversion() >= minusd, "didn't send enough eth");
        // above thing works like this if condition false then print thing after ,
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
        funders.push(msg.sender);
        addresstofund[msg.sender] += msg.value;
    }

    //THIS BELOW LINE CODE IS BEING COPIED INTO PRICECONVERTER.SOL TO BE USED AS PACKAGE
    // function getprice() public view returns(uint256){
    //     //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    //     //abi
    //     AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    // (, int256 price,,,) = pricefeed.latestRoundData();
    // //above line gives eth price in usd.
    // //like 2000.00000000,solidity does not work with decimal.
    // return uint256(price * 1e10); //bcz give 8 zeroes so /
    // }
    // function getconversion(uint256 ethAmount) public view returns(uint256){
    //         // 1Eth ?
    //         // 2000_000000000000000000)*1_000000000000000000/1e18;
    //         uint256 ethprice = getprice();
    //         uint256 ethAmountusd = (ethprice * ethAmount)/(1e18);
    //         return ethAmountusd;
    // }
    // function getVersion() public view returns (uint256){
    //     return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }

    function withdraw() public {
        //for loop
        // for(starting index,ending index ,step amount)
        for (
            uint256 funderindex = 0;
            funderindex < funders.length;
            funderindex++
        ) {
            address funder = funders[funderindex];
            addresstofund[funder] = 0;
        }
        funders = new address[](0); //this will reset the funder array to 0.length;
        //reset the array
        //withdraw the funds.

        // send cryptocurency there are three ways:
        // 1. transfer 2. send  3. call
        //transfer
        //here we are typecasting msg.sender type to payable type.
        //msg.sender gives addres  transfer the balance of respectiv eaddress.
        //if below fails then it gives error and automatically revert the transaction.

        // payable(msg.sender).transfer(address(this).balance);
        // //send
        // //it will give error in bool and revert transaction only if we use require.

        // bool success= payable(msg.sender).send(address(this).balance);
        // require(success,"Send Failed");
        //call > lower level command
        (bool callsuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callsuccess, "Call failed");
    }
}
