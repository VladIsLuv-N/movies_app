import 'package:flutter/material.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/presentation/screens/popular_movies/popular_movies_screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const PopularMoviesScreens(),
    );
  }
}
