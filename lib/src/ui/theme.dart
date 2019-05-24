import 'package:flutter/material.dart';

final ThemeData themeLight = ThemeData(
  dividerColor: Colors.grey[400].withOpacity(0.3),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      fontSize: 20,
      color: Colors.redAccent
    )
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.redAccent
    ),
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