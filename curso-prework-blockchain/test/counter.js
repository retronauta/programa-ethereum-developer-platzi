const { require } = require("chai");

describe("Counter Contract", () => {
  it("Should  increment the counter", async () => {
    //* Almacenamos nuestro contract con ethers
    const Counter = await ethers.getContractFactory("Counter");
    //* Desplegamos nuestro contrato. Deploy llama al constructor del contract
    const counter = await Counter.deploy(0);
    await counter.increment();
    const updatedCounter = await counter.getCounter();

    expect(updatedCounter).to.equal(1);
  });
});
