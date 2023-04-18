import { ethers } from "hardhat";
import * as readline from "readline";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { PostManager } from "../typechain-types";

let contract: PostManager;
let accounts: SignerWithAddress[];

async function initContracts() {
    const contractFactory = await ethers.getContractFactory("PostManager");
    contract = await contractFactory.deploy();
    const dep = await contract.deployed();
    console.log(`Deployed at: `,dep.address);

  }

  async function initAccounts() {
    accounts = await ethers.getSigners();
    console.log(`using: `, accounts[0].address)
  }
  
async function  createPost() {
    const postCID ='bafybeieof6wkx4rrgpislbdd5ag2423qa2tv2egobfteuyev2p5lqf3orm'
    console.log('posting...')
    const data =  await contract.connect(accounts[1]).createPost(postCID, 'image1CID', 'image2CID');
    const res1 = await data.wait();
    console.log(`Posted!: `,)
    const data1 =  await contract.connect(accounts[2]).createPost('post2','post2','post2');
    const res = await data.wait();
    console.log(`Posted!: `,)
    const data2 =  await contract.connect(accounts[3]).createPost('postCID','postCID','postCID');
    const res2 = await data.wait();
    console.log(`Posted!: `,)
}
async function getPosts() {
    console.log(`getting Posts`)
    const data = await contract.getPosts();
    console.log(`here: `, data);
    console.log(`Proceeding to get more data...`);
    const data1 = await contract.getPostsData(data);
    console.log(`Here you go: `, data1)

    console.log(`CID HERE: `, await contract.CID())
}
const main = async()=>{
    await initContracts();
    await initAccounts();
    await createPost();
    await getPosts();
}
main();