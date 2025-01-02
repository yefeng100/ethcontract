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

    //部署nft
    function deployNft(string memory _name, string memory _symbol, string memory _uri, uint _price, address _payAddress) public {
        require(msg.sender == owner, "must be on owner");
        address nftAddress = address(new CoctNft(_name, _symbol, _uri, _price, _payAddress));
        nftContractsMap[nftAddress] = _name;
        nftContracts.push(nftAddress);
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