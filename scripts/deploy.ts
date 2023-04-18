import { ethers } from "hardhat";

async function main() {
  
  
  const PostManager = await ethers.getContractFactory("PostManager");
  const postManager = await PostManager.deploy();

  await lock.deployed();

  console.log(`Lock with 1 ETH and unlock timestamp ${unlockTime} deployed to ${lock.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
