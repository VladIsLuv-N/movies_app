import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class HorrorsMoviesStates {}

class HorrorsMoviesInitialState extends HorrorsMoviesStates {}

class HorrorsMoviesLoadingState extends HorrorsMoviesStates {}

class HorrorsMoviesLoadedState extends HorrorsMoviesStates {
  final List<Movie> movies;

  HorrorsMoviesLoadedState({required this.movies});
}

class HorrorsMoviesErrorState extends HorrorsMoviesStates {
  final String errorMessage;

  HorrorsMoviesErrorState({required this.errorMessage});
}
