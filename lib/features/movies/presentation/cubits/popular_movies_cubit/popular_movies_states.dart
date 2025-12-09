import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class PopularMoviesStates {}

class PopularMoviesInitialState extends PopularMoviesStates {}

class PopularMoviesLoadingState extends PopularMoviesStates {}

class PopularMoviesLoadedState extends PopularMoviesStates {
  final List<Movie> movies;

  PopularMoviesLoadedState({required this.movies});
}

class PopularMoviesErrorState extends PopularMoviesStates {
  final String errorMessage;

  PopularMoviesErrorState({required this.errorMessage});
}
