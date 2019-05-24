import 'dart:io';
import '../models/pokemon.dart';
import 'package:flutter/material.dart';
import '../blocs/detail_poke_bloc.dart';
import '../ui/icons/custom_icons_icons.dart';

class PokemonDetail extends StatefulWidget {
  final int id;
  final String nombre;

  const PokemonDetail({Key key, this.id, this.nombre}) : super(key: key);

  @override
  _PokemonDetail createState() {
    return _PokemonDetail();
  }
}

class _PokemonDetail extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    bloc.getPokemon(id: widget.id);
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400,
                floating: true,
                pinned: true,
                snap: false,
                title: Text(
                  widget.nombre[0].toUpperCase() + widget.nombre.substring(1),
                  style: Theme.of(context).primaryTextTheme.title,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: Container(
                    color: Colors.grey[400],
                    child: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png',
                        fit: BoxFit.fitHeight),
                    padding: EdgeInsets.only(top: 80),
                  ),
                ),
              )
            ];
          },
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 120, left: 50, right: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: StreamBuilder(
              stream: bloc.pokemonDetail,
              builder: (BuildContext context, AsyncSnapshot<Pokemon> pokemon) {
                if (pokemon.hasData) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                "# ${widget.id}",
                                style: Theme.of(context).primaryTextTheme.title,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Grass | Posion",
                                style: Theme.of(context).primaryTextTheme.body1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Alto: ${(pokemon.data.height * 0.1).round()} mts",
                                style: Theme.of(context).primaryTextTheme.body1,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Peso: ${(pokemon.data.weight * 0.220462).round()} lbs",
                                style: Theme.of(context).primaryTextTheme.body1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
