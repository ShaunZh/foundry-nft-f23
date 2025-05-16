// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";



contract MintBasicNft is Script {
    string public constant TOKENURI = "https://ipfs.io/ipns/k51qzi5uqu5dht1yivji8p2g9dmzth5akn2os2ams04hjrmgzplthtjdqpuiow";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(TOKENURI);
        vm.stopBroadcast();
    }
}