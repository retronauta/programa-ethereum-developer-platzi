const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Pokemon contract", function () {
  it("Pokemon Factory shouldn't pokemons", async () => {
    //* nos habilita el contrato
    const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
    //* hago un deploy del contrato
    const hardhatPokemon = await PokemonFactory.deploy();
    //* Llamo al metodo para retornarme todos los pokemons
    const pokemons = await hardhatPokemon.getAllPokemons();
    expect(pokemons.length).to.equal(0);
  });

  // it("Event log when new pokemon is created", async () => {
  // });
});
