// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//* contract es como una clase
contract PokemonFactory {
    //* Estructura llamada Pokemon que guardara el id y nombre de este
    struct Pokemon {
        uint id;
        string name;
    }

    struct Type{
        string pokemonName;
        string nameType;
    }

    //* Estructura para guardar el nombre y habilidad opcionalmente para cada pokemon
    struct Habilitie {
        string pokemonName;
        string name;
        string description;
    }

    //* Un array privado a partir del struct Pokemon
    Pokemon[] private pokemons;

    //* Un array privado para las habilidades
    Habilitie[] private habilities;

    // Type[] private types;

    //* Un mapping es como un diccionario o hashtable con pares key:value
    //* Permite guardar el id de un pokemon a un address  | <id_pokemon> -> <address>
    mapping(uint => address) public pokemonToOwner;
    //* Aqui guardare la cantidad de pokemons que tiene un owner// <address> -> 19
    mapping(address => uint) ownerPokemonCount;

    mapping(string => string[]) weaknesses;

    mapping(string => string[]) types;

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
        //* Pusheo a mi struct el id y name
        pokemons.push(Pokemon(_id, _name));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name);
    }

    function getWeaknesses(string memory _type) public view returns(string[] memory){
        return weaknesses[_type];
    }

    // function getPokemonWeakness(string memory _pokemonName)public payable returns(string[] memory){
    //     string[] memory pokemonTypes;
    //     string[] memory weaknessesOfPokemon;
    //     pokemonTypes = getTypes(_pokemonName);
    //     for(uint i = 0; i < pokemonTypes.length; i++){
    //         for(uint j = 0; j < getWeaknesses(pokemonTypes[i]).length; i++){
    //             weaknessesOfPokemon[i] = "hola";
    //         }
    //     }
    //     // getWeaknesses(_type);
    //     return weaknessesOfPokemon;
    // }

    function setWeakness(string memory _type, string memory _weakness)public{
        weaknesses[_type].push(_weakness);
    }

    function setTypes(string memory _pokemonName, string memory _type) public{
        types[_pokemonName].push(_type);
    }

    function getTypes(string memory _pokemonName) public view returns(string[] memory){
        return types[_pokemonName];
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }

    function addHabilitie(
        string memory _pokemonName,
        string memory _name,
        string memory _description
    ) public {
        habilities.push(Habilitie(_pokemonName, _name, _description));
    }

    function getAllHabilities() public view returns (Habilitie[] memory) {
        return habilities;
    }

}
