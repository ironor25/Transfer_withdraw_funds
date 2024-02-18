//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract new_contract{
    uint256  n;
 //   uint256[] list_n;  //[0,23,44]
    struct person{
        uint256 n;
        string name;
    }
    // dynamic array
    //we cna also do it  like this taking in array and then  giving it to struct
    person[] public list_n;
    // we can do this adding name and no. by object adn constructor
    // person public pat = person(25,"Deepak");
    // person public lucy = person(5,"Lucideus");

    //> we want mapping like a dictionary.
    //so we use mapping 
    //so suppose if we give a name it automatically give its no.
    //with no iteration using list or array.
    mapping (string => uint256) public map_n;
    function store(uint256 m ) public virtual {
        n = m;
        give();
    }
    function give() public view returns (uint256){
        return n;
    }
    //evm can access and store inof in six places:
    //stack,memory,storage,calldata,code,logs.
    //calldata ,memory ,storage
    //calldata,memory here means that _name is going to exist
    //for temporary period of time.
    //it is for string datatypes bcz they need this kind of allocation.
    //memory -> temp. varible can be modified .
    //calldata -> temp. variable can not be modified.
    //storage > permanent variable can be modified.
    //yaha pr storage nahi liya ja sakta bcz ye viase bhi temp.
    //use ke liye hai so solidity will give error.
    function addperson(string memory _name, uint256 m) public{
        //same you can do this in thhis way.
        // person public pat = person(25,"Deepak");
        // list_n.push(pat);
        //or do ti in this way
        list_n.push(person(m,_name));
        map_n[_name] = m;
    }
}