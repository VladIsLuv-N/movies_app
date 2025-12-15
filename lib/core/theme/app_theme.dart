import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xFF242A32),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF242A32),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Color(0xFF67686D),
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Color(0xFF92929D),
        fontWeight: FontWeight.w500,
      ),

      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF67686D),
      strokeWidth: 5,
      strokeCap: StrokeCap.round,
    ),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: const Color(0xFFffeded),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFffeded),
      actionsIconTheme: IconThemeData(color: Color(0xFF242A32)),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF242A32),
      ),

      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Color(0xFF67686D),
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Color(0xFF92929D),
        fontWeight: FontWeight.w500,
      ),

      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Color(0xFF242A32),
        fontWeight: FontWeight.w500,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF67686D),
      strokeWidth: 5,
      strokeCap: StrokeCap.round,
    ),
  );
}
