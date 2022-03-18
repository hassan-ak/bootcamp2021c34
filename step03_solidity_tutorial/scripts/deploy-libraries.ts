import { ethers } from "hardhat";

async function main() {
  // We get the contract to deploy
  const ContractMath = await ethers.getContractFactory("ContractMath");
  const contractMath = await ContractMath.deploy();

  await contractMath.deployed();
  console.log("ContractMath deployed to:", contractMath.address);

  console.log("***");
  console.log("***");
  console.log("***");

  console.log("Result 1 = ", (await contractMath.checkResult()).toString());
  console.log(
    "Result 2 = ",
    (await contractMath.checkResultUpdated()).toString()
  );
  const txt1 = await contractMath.doSomeWork();
  const recipt = await txt1.wait();
  console.log("Recipt = ", recipt);
  console.log("Events = ", recipt.events);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
