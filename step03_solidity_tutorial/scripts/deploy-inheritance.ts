import { ethers } from "hardhat";
import { Inheritance, Inheritance__factory } from "../typechain";

async function main() {
  // We get the contract to deploy
  // const Inheritance: Inheritance__factory = await ethers.getContractFactory(
  //   "Inheritance"
  // );
  // const inheritance: Inheritance = await Inheritance.deploy();

  const Inheritance = await ethers.getContractFactory("Inheritance");
  const inheritance = await Inheritance.deploy();

  await inheritance.deployed();
  console.log("Inheritance deployed to:", inheritance.address);
  console.log("******");
  console.log("******");
  console.log("******");

  console.log(
    "Results 1 = ",
    await (await inheritance.checkFunction1()).toString()
  );
  console.log(
    "Results 2 = ",
    await (await inheritance.checkFunction2()).toString()
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
