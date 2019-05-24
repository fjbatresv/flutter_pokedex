import 'dart:async';
import 'dart:convert';
import '../models/pokemon.dart';
import '../models/pokemon_list.dart';
import 'package:http/http.dart' show Client;

class PokeApiProvider {
  Client client = Client();

  Future<PokemonList> fetchPokemonList(int offset, int limit) async {
    final response = await client.get("https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=$limit");
    if (response.statusCode == 200) {
      return PokemonList.fromJson(json.decode(response.body));
    } else {
      print("Failed to get pokemons: ${response.body}");
    }
  }

  Future<Pokemon> getPokemon(int id) async {
    final response = await client.get('https://pokeapi.co/api/v2/pokemon/$id');
    if (response.statusCode == 200) {
      return Pokemon.fromMap(json.decode(response.body));
    } else {
      print('FALID TO GET POKEMON: $id');
    }
  }
 
}