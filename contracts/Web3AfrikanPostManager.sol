//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
 import "./Web3AfrikanPost.sol";

contract Web3AfrikanPostManager {
    uint256 public postIdCounter;
    Web3AfrikanPost[] public posts;
    mapping(address => uint256) public postIDs;


    function createPost (string memory articleCID) public  returns (bool) {
        uint256 postID = postIdCounter;
        postIdCounter++;
        Web3AfrikanPost post = new Web3AfrikanPost(articleCID, msg.sender);
        posts.push(post);
        postIDs[address(post)] = postID;
        return true;
    }
    function addComment(string memory _commentCID, address _postAddress)external returns (bool){
    uint256 postID = postIDs[_postAddress];
    posts[postID].addComment(_commentCID);
    return true; 
  }
  function getPosts() external view returns(address[] memory _posts) {
    _posts = new address[](postIdCounter);
    for (uint256 i = 0; i < postIdCounter; i++) {
      _posts[i] = address(posts[i]);
    }
    return _posts;

  }
  function getPostsData(address[] memory _postList) external view returns (string[] memory postCID, uint256[] memory numberOfComments) {
        postCID = new string[](_postList.length);
        numberOfComments = new uint256[](_postList.length);
        
        for (uint256 i = 0; i < _postList.length; i++) {
            uint256 postID = postIDs[_postList[i]];
            postCID[i] = posts[postID].articleCID();
            numberOfComments[i] = posts[postID].getNumberOFComments();
        }
        
        return (postCID, numberOfComments);
    }
    
}