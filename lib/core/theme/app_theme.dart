import 'package:clean_movies_app/core/extensions/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    extensions: [
      const AppColors(
        outlineTextBg: Color(0xFF3A3F47),
        buttonBg: Color(0xFF3A3F47),
        outlineTextBorder: Color(0xFF0296E5),
      ),
    ],

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

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFF3A3F47),
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

    extensions: [
      const AppColors(
        outlineTextBg: Color(0xFFC6B5B5),
        buttonBg: Color(0xFFC6B5B5),
        outlineTextBorder: Colors.black,
      ),
    ],

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

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFFC6B5B5),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF67686D),
      strokeWidth: 5,
      strokeCap: StrokeCap.round,
    ),
  );
}
