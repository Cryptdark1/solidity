// SPDX-Licence-identifier: MLT

pragma solidity ^0.8.18;

// import "./html1.sol";
import {SimpleStorage} from "./html1.sol";
contract StorageFactory{
    //SimpleStorage[] public listOfSimpleStorageContracts
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public{
        SimpleStorage newSimpleStorageContracts = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContracts);
    }

    function stStore(uint _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        //address
        //ABI - apllication binary interface
        //SimpleStorage mysimplestorage = listOfSimpleStorageContracts[_simplestorageIndex];
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    function stGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}