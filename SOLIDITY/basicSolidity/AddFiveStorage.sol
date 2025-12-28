// SPDX-Licecse-Identifier: MIT

pragma solidity ^8.0.18

import {SimpleStorage} from "./html.sol";
contract AddFiveStorage is SimpleStorage{
   // +5
   // overide
   // virtual overide
   function store (uint256 _newNumber) public override{
    myfavoriteNumber = _newNumber + 5;
   }
}