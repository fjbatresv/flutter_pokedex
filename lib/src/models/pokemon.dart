import 'dart:convert';

class Pokemon {
  int _baseExperience;
  int _height;
  int _id;
  bool _isDefault;
  String _locationAreaCounter;
  String _name;
  int _order;
  int _weight;

  Pokemon.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _baseExperience = map['base_experience'];
    _height = map['height'];
    _isDefault = map['is_default'];
    _locationAreaCounter = map['location_area_counter'];
    _name = map['name'];
    _order = map['order'];
    _weight = map['weight'];
  }

  int get baseExperience => _baseExperience;
  int get height => _height;
  int get id => _id;
  int get order => _order;
  int get weight => _weight;
  bool get isDefault => _isDefault;
  String get locationAreaCounter => _locationAreaCounter;
  String get name => _name;

}