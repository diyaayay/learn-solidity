// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/MyToken.sol";

contract TestMyToken is Test {
    MyToken c;

    function setUp() public {
        c = new MyToken();
    }

    function testMint() public {
        c.mint(address(this),100);
        assertEq(c.balanceOf(address(this)),100,"ok");
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB), uint256(0),"ok");
        c.mint(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, 100);
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),100,"ok");
    }

    function testTransfer() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100, "ok");
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),uint256(0), "ok");
        c.transfer(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, 20);
        assertEq(c.balanceOf(address(this)),80,"ok");
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),20,"ok");
        vm.prank(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
        c.transfer(address(this), 10);
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),10,"ok");
        assertEq(c.balanceOf(address(this)),90);


    }

    function testApprovals() public {
        c.mint(address(this),100);
        c.approve(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB,10);
        assertEq(c.allowance(address(this), 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),10,"ok");
        assertEq(c.allowance(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, address(this)),0,"ok");
        vm.prank(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
        c.transferFrom(address(this),0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB,5);
        assertEq(c.balanceOf(address(this)),95,"ok");
        assertEq(c.balanceOf(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),5,"ok");
        assertEq(c.allowance(address(this), 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB),5,"ok");
    }

    function test_Revert_When_Approvals() public {
        c.mint(address(this), 100);
        c.approve(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f, 10);
        
        vm.expectRevert();
        vm.prank(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f);
        c.transferFrom(address(this), 0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f, 100);
    }

    function test_Revert_When_Transfer() public {
        c.mint(address(this), 20);
        vm.expectRevert();
        c.transfer(0x587EFaEe4f308aB2795ca35A27Dff8c1dfAF9e3f, 100);
    }
}