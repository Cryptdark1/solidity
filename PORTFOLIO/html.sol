// SPDX-License-Identifier: MITs
pragma solidity ^0.8.18; // solidity versions

contract SimpleStorage {
     //Basic Types: boolean, unint, int, address,bytes
    // favorite number is initially 0 if no value is given
    uint256 myfavoriteNumber; //0

    //uint256[] listofFavoriteNumbers;
    struct person{
       uint256 favoriteNumber;
       string name; 
    }
   person[] public ListOfPoeple;//[]
    // person public pat = person({favoriteNumber : 7, name: "pat"});

    function store( uint256 _favoriteNumber) public{
        myfavoriteNumber =_favoriteNumber;

    }
   function retrieve() public view returns (uint256){
    return myfavoriteNumber;
   }
   function addPerson(string memory _name, uint256 _favoriteNumber) public{
   // person memory newPerson = person(_favoriteNumber, _name);
    ListOfPoeple.push(person(_favoriteNumber, _name));
   }
}