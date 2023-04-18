//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Web3AfrikanPost {

    string public articleCID;
    uint public createdAT;
    address public author;
    string[] public commentCIDs;

    constructor(string memory _articleCID, address _author) {
        articleCID = _articleCID;
        author = _author;
    }

    function addComment(string memory commentCID)public returns(bool) {
       commentCIDs.push(commentCID);
       return true;
    }
    
    function getComments() public view returns (string[] memory) {
        return commentCIDs;
    }
    function getNumberOFComments() public view returns (uint256) {
        return commentCIDs.length;
    }
    

}