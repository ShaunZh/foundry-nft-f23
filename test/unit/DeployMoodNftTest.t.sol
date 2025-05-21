// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {console} from "forge-std/Script.sol";
import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testSvgToImageUri() public view {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCI+IDx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+SGkhIFlvdXIgYnJvd3NlciBkZWNvZGVkIHRoaXM8L3RleHQ+IDwvc3ZnPg==";
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="500"> <text x="0" y="15" fill="black">Hi! Your browser decoded this</text> </svg>';

        string memory actualUri = deployer.svgToImageURI(svg);

        assert(keccak256(abi.encodePacked(actualUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}