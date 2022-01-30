import { ethers } from "hardhat";

async function main() {
  const Main = await ethers.getContractFactory("Main");
  const main = await Main.deploy();

  await main.deployed();

  console.log("Greeter deployed to:", main.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
