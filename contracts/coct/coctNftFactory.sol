// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CoctNft} from "./coctNft.sol";

contract CoctNftFactory{
    //owner地址
    address owner;
    //nft地址列表
    address[] private nftContracts;
    mapping (address => string) private nftContractsMap;

    //构造函数
    constructor(){
        owner = msg.sender;
    }

    //自己地址
    function getAddress() public view returns (address) {
        return address(this);
    }

    //获取owner地址的余额
    function getOwnerBalance() public view returns (uint) {
        uint ownerBalance = owner.balance;
        return ownerBalance;
    }

    //部署nft
    function deployNft(string memory _name, string memory _symbol, string memory _uri, uint _price, address _payAddress) public {
        require(msg.sender == owner, "must be on owner");
        address nftAddress = address(new CoctNft(_name, _symbol, _uri, _price, _payAddress));
        nftContractsMap[nftAddress] = _name;
        nftContracts.push(nftAddress);
    }

    //获取nft地址
    function getNftAddressList() public view returns (address[] memory){
        return nftContracts;
    }

    //获取name
    function getNftName(address _nftAddress) public view returns (string memory){
        return CoctNft(_nftAddress).getName();
    }

    //设置合约价格
    function setMintPrice(address _nftAddress, uint _price) public {
        CoctNft(_nftAddress).setMintPrice(_price);
    }

    //获取价格
    function getMintPrice(address _nftAddress) public view returns (uint){
        uint price = CoctNft(_nftAddress).getMintPrice();
        return price;
    }

}