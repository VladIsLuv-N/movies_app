import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/core/theme/app_theme.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit/horrors_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/pages/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PopularMoviesCubit>()..loadPopularMovies(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMoviesCubit>()..loadTrendingMovies(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<HorrorsMoviesCubit>()..loadHorrorsMovies(),
          ),
          BlocProvider(
            create: (context) =>
                getIt<UpcomingMoviesCubit>()..loadUpcomingMovies(),
          ),
        ],
        child: const MoviesPage(),
      ),
    );
  }
}
