import 'package:flutter/material.dart';

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
                title: Container(
                  alignment: Alignment.centerLeft,
                  height: double.infinity,
                  width: double.infinity,
                  child: Text(
                    widget.nombre[0].toUpperCase() + widget.nombre.substring(1),
                    style: Theme.of(context).primaryTextTheme.title,
                  ),
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50)
              )
            ),
          ),
        ),
      ),
    );
  }
}
