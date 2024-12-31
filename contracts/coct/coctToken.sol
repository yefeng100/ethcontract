// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//不公布合约UNLICENSED

//导入ERC20库
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//继承ERC20合约
contract CoctToken is ERC20 {
    //owner地址
    address public owner;

    //mint事件
    event mintEvent(address _toAddr, uint256 _num);

    //构造函数
    constructor(string memory _name, string memory _symbol, address _account, uint256 _num)ERC20(_name,_symbol){
        owner = msg.sender;
        _mint(_account, _num * 10 ** decimals());
        //发币事件
        emit mintEvent(_account, _num);
    }

    //检查是否owner
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    //检查数量不能太少
    modifier numCheck(uint256 _num){
        require(_num >= 1, "The quantity cannot be too small.");
        _;
    }

    //发币
    function mint(address _toAddr, uint256 _num) public onlyOwner numCheck(_num) {
        //开始发币
        _mint(_toAddr, _num * 10 ** decimals());        
        //发币事件
        emit mintEvent(_toAddr, _num);
    }
}