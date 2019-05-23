import 'ui/theme.dart';
import 'ui/pokedex.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeLight,
      home: Pokedex(),
    );
  }
}