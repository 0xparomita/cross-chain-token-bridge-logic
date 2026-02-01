// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BridgeL1 is Ownable {
    IERC20 public token;
    
    event Locked(address indexed user, uint256 amount, uint256 nonce);
    event Unlocked(address indexed user, uint256 amount, uint256 nonce);

    mapping(uint256 => bool) public processedNonces;

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function lock(uint256 _amount, uint256 _nonce) external {
        require(token.transferFrom(msg.sender, address(this), _amount), "Transfer failed");
        emit Locked(msg.sender, _amount, _nonce);
    }

    function unlock(address _user, uint256 _amount, uint256 _nonce) external onlyOwner {
        require(!processedNonces[_nonce], "Already processed");
        processedNonces[_nonce] = true;
        require(token.transfer(_user, _amount), "Transfer failed");
        emit Unlocked(_user, _amount, _nonce);
    }
}
