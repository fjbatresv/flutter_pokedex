import 'package:rxdart/rxdart.dart';
import '../models/pokemon_list.dart';
import '../resources/repository.dart';

class PokeBloc {
  final Repository _repository = Repository();
  final PublishSubject _pokeListFetcher = PublishSubject<PokemonList>();

  Observable<PokemonList> get pokemonList => _pokeListFetcher.stream;

  fetchPokemons({int offset = 0, int limit = 20}) async {
    PokemonList _list = await _repository.fetchPokemons(offset, limit);
    _pokeListFetcher.sink.add(_list);
  }

  dispose() {
    _pokeListFetcher.close();
  }
}

final bloc = PokeBloc();