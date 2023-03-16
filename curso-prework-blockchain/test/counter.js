const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter Contract", () => {
  it("Should  increment the counter", async () => {
    //* Almacenamos nuestro contract con ethers
    const Counter = await ethers.getContractFactory("Counter");
    //* Desplegamos nuestro contrato. Deploy llama al constructor del contract
    const counter = await Counter.deploy(0);
    await counter.increment();
    //* Obtenemos el valor de nuestro contador actualizado
    const updatedCounter = await counter.getCounter();

    //* Esperamos que nuestro contador actualizado sea igual a 1
    expect(updatedCounter).to.equal(10);
  });
});
