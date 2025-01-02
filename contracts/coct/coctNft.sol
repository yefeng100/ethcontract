// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CoctNft  {
    string private name;                    //nft名字
    string private symbol;                  //nft名字
    string private uri;                     //nft图片地址
    uint private mintPrice;                 //购买nft价格
    address private payAddress;             //支付地址
    

    //构造函数
    constructor(string memory _name, string memory _symbol, string memory _uri, uint _price, address _payAddress) {
        name = _name;
        symbol = _symbol;
        uri = _uri;
        mintPrice = _price;
        payAddress = _payAddress;
    }
    
    //设置nft名字
    function setName(string memory _name) public {
        name = _name;
    }

    //获取nft名字
    function getName() public view returns (string memory){
        return name;
    }
    
    //设置Symbol
    function setSymbol(string memory _symbol) public {
        symbol = _symbol;
    }

    //获取Symbol
    function getSymbol() public view returns (string memory){
        return symbol;
    }
    
    //设置图片地址
    function setUri(string memory _uri) public {
        uri = _uri;
    }

    //获取图片地址
    function getUri() public view returns (string memory){
        return uri;
    }

    //设置价格
    function setMintPrice(uint _price) public {
        mintPrice = _price;
    }

    //获取价格
    function getMintPrice() public view returns(uint){
        return mintPrice;
    }
    //设置支付合约地址
    function setPayAddress(address _payAddress) public {
        payAddress = _payAddress;
    }

    //获取支付合约地址
    function getPayAddress() public view  returns (address){
        return payAddress;
    }
}