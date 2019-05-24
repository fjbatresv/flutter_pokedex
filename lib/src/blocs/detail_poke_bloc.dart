import '../models/pokemon.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class DetailPokeBloc {
  final Repository _repository = Repository();
  final PublishSubject _pokeListFetcher = PublishSubject<Pokemon>();

  Observable<Pokemon> get pokemonDetail => _pokeListFetcher.stream;

  getPokemon({int id = 1}) async {
    Pokemon _list = await _repository.getPokemon(id);
    _pokeListFetcher.sink.add(_list);
  }

  dispose() {
    _pokeListFetcher.close();
  }
}

final bloc = DetailPokeBloc();
