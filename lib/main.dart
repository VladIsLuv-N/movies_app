import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:clean_movies_app/movies_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetIt();

  runApp(
    BlocProvider(
      create: (_) => getIt<ThemeCubit>()..loadTheme(),
      child: const MoviesApp(),
    ),
  );
}
