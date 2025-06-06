// SPDX-License-Identifier: MIT  

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
    
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
        // console.log(sadSvg, happySvg);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURI = "data:image/svg+xml;base64,";
        console.log('before baseURI', baseURI);
        string memory svgBase64Encoded = Base64.encode(bytes(svg));
        console.log('baseURI', baseURI);
        console.log('svgBase64Encoded', svgBase64Encoded);
        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }

}