import 'dart:convert';

class PokemonList {
    int _count;
    String _next;
    String _previous;
    List<_Item> _results;

    PokemonList.fromJson(Map<String, dynamic> json) {
      _count = json['count'];
      _next = json['next'];
      _previous = json['previous'];
      _results = json['results'].map<_Item>((i) {
        return _Item(i);
      }).toList();
    }

    int get count => _count;
    String get next => _next;
    String get previous => _previous;
    List<_Item> get results => _results;

}

class _Item {
  String _name;
  String _url;

  _Item(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  String get name => _name;
  String get url => _url;

}