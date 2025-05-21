// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {console} from "forge-std/console.sol";
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {Vm} from "forge-std/Vm.sol";

contract MintBasicNft is Script {
    string public constant TOKENURI = "https://ipfs.io/ipns/k51qzi5uqu5dht1yivji8p2g9dmzth5akn2os2ams04hjrmgzplthtjdqpuiow";

    function run() external {
        //  Vm.DirEntry[] memory entries = vm.readDir("./broadcast", 3);
        // console.log("entries", entries);
        // address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid, "broadcast");

        // NOTE: Set a environment variable BASIC_NFT_ADDRESS
        address contractAddress = vm.envAddress("BASIC_NFT_ADDRESS");        
        mintNftOnContract(contractAddress);
        // mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(TOKENURI);
        vm.stopBroadcast();
    }
}