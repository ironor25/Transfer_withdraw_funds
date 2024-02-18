// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./simplestorage.sol";
contract storagefactory{
    new_contract[] public im_contract_lst;
    function create_pre_contract() public {
        new_contract  new_lst  = new new_contract();
        im_contract_lst.push(new_lst);
    }
    function sfstore(uint256 sfindex,uint new_no) public {
       // to interact with a contract we always need : address ,abi:application binary.
        new_contract mystorage = im_contract_lst[sfindex];
        return mystorage.store(new_no);
        
    }
    function sfget(uint256 sfindex) public view returns (uint256){
        new_contract mystorage = im_contract_lst[sfindex];
        return mystorage.give();
    }
}