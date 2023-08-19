// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';
import '@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol';
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract UniswapExample {
    address private _uniswapRouter;
    address private _tokenAddress;

    constructor(address uniswapRouter, address tokenAddress) {
        _uniswapRouter = uniswapRouter;
        _tokenAddress = tokenAddress;
    }

    function swapTokens(uint256 amountIn, uint256 amountOutMin) external {
        IUniswapV2Router02 router = IUniswapV2Router02(_uniswapRouter);
        address[] memory path = new address[](2);
        path[0] = _tokenAddress;
        path[1] = router.WETH();

        router.swapExactTokensForETH(
            amountIn,
            amountOutMin,
            path,
            address(this),
            block.timestamp
        );
    }
}
