// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//* contract es como una clase
contract PokemonFactory {
    struct Pokemon {
        uint id;
        string name;
    }

    //* Un array privado de tipo Pokemon
    Pokemon[] private pokemons;

    //*  Permite guardar el pokemon a un address  | 01 -> <address>
    mapping(uint => address) public pokemonToOwner;
    //* Aqui guardare la cantidad de pokemons que tiene un owner// <address> -> 19
    mapping(address => uint) ownerPokemonCount;

    event eventNewPokemon(string name);

    //* Obtengo la longitud del string
    function getStringLength(
        string memory _string
    ) private pure returns (uint256) {
        bytes memory stringLength = bytes(_string);
        return stringLength.length;
    }

    function createPokemon(string memory _name, uint _id) public {
        require(_id > 0, "Pokemon's id should be upper than zero");
        require(
            getStringLength(_name) > 2,
            "Name's length must not be 0 or less tan 2"
        );
        pokemons.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name);
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }
}
