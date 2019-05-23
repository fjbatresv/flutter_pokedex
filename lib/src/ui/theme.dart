import 'package:flutter/material.dart';

final ThemeData themeLight = ThemeData(
  dividerColor: Colors.grey[400].withOpacity(0.6),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 10,
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.redAccent,
        fontFamily: 'PokemonSolid',
        letterSpacing: 2,
        fontSize: 20
      )
    )
  )
);