import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),

    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontFamily: 'Merriweather',
        fontSize: 20,
      ),
      bodySmall: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontFamily: 'Merriweather',
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        fontFamily: 'Merriweather',
      ),
      bodyMedium: TextStyle(
        color: Colors.white54,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      )
    ),
  );
}
