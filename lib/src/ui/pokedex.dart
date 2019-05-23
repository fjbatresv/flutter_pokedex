import '../blocs/poke_bloc.dart';
import '../models/pokemon_list.dart';
import 'package:flutter/material.dart';

class Pokedex extends StatelessWidget {
  int offset = 0;
  int limit = 20;
  PokemonList globalList;
  ScrollController _scrollController;

  void initScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      offset = offset + limit;
      print("offset: $offset, limit: $limit");
      bloc.fetchPokemons(offset: offset, limit: limit);
    }
  }

  @override
  Widget build(BuildContext context) {
    initScrollController();
    bloc.fetchPokemons(offset: offset, limit: limit);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: StreamBuilder(
        stream: bloc.pokemonList,
        builder: (BuildContext context, AsyncSnapshot<PokemonList> list) {
          if (list.hasData) {
            return buildList(list);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<PokemonList> list) {
    if (globalList == null) {
      globalList = list.data;
    } else {
      list.data.results.forEach((r) {
        if (!globalList.results.contains(r)) {
          print(r.name);
          globalList.results.add(r);
        }
      });
    }
    return ListView.builder(
      itemCount: globalList.results.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor
              )
            )
          ),
          child: InkWell(
            onTap: (){
              //TODO: Launch detail of pokemon
            },
            child: Row(
              children: <Widget>[
                Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"),
                Text(globalList.results[index].name)
              ],
            ),
          ),
        );
      },
    );
  }
}
