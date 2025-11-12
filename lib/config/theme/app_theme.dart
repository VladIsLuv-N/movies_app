import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      surfaceTintColor: Colors.transparent,
    ),

    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      )
    )
  );
}