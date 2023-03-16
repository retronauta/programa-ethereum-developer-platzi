const { ethers } = require("hardhat");

async function main() {
  //* Conocer desde que direccion de eth desplegamos el contract con .getSigners
  const [deployer] = await ethers.getSigners();
  console.log({ deployer });

  const Counter = await ethers.getContractFactory("Counter");
  const counter = await Counter.deploy(0);

  //* Mostramos el address desde donde desplegamos nuestro contrato desplegado
  console.log({ contractAddres: counter.address });
}

//* Ejecutamos nuestra funcion
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.log({ errorMessage: error });
    //* Salimos del proceso con 1 indicando que fallo
    process.exit(1);
  });
