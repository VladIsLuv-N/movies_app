import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class TrendingMoviesStates {}

class TrendingMoviesInitialState extends TrendingMoviesStates {}

class TrendingMoviesLoadingState extends TrendingMoviesStates {}

class TrendingMoviesLoadedState extends TrendingMoviesStates {
  final List<Movie> movies;

  TrendingMoviesLoadedState({required this.movies});
}

class TrendingMoviesErrorState extends TrendingMoviesStates {
  final String errorMessage;

  TrendingMoviesErrorState({required this.errorMessage});
}
