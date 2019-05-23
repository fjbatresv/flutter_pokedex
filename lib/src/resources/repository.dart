import 'dart:async';
import 'poke_api_provider.dart';
import '../models/pokemon_list.dart';

class Repository {
  final PokeApiProvider _pokeApiProvider = PokeApiProvider();

  Future<PokemonList> fetchPokemons(int offset, int limit) {
    return _pokeApiProvider.fetchPokemonList(offset, limit);
  }
}