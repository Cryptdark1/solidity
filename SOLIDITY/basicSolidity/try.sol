//SPDX-Licence-Identifier: MITs
pragma solidity ^8.0.18; // solidity versions

contract StorageContainer{
    uint myNumber; // its a variable that stores number/intergers. initially 0
    
    struct person{
        uint256 favNumber;
        string name;
    }                // this helps us create our own class
    person[] public listOfPeople; // creates an empty list or array

    mapping(string => uint256) public nameTOFavoriteN;
    //it creates something similar to a dictionary. 

    function store( uint256 _favoriteNumber) public{
        myNumber = _favoriteNumber
    }// this function just store any number input to muNumber var.
    function retrieve() public view returns(uint256){
        return myNumber;
    }// it returns the number stored in the myNumber function
    function addPerson(string memory _name, uint256 _Number) public{
        listOfPeople.push(person(_name, _Number)); // addnames and number to the list
        nameTOFavoriteN[_name] = _Number;// helps to get number with the name using mapping

    }// this function  basically gets the user a name and number and then add it to the list 
    // also where we can get favorite number with just typing the name.
}