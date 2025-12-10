import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';

abstract class UpcomingMoviesStates {}

class UpcomingMoviesInitialState extends UpcomingMoviesStates {}

class UpcomingMoviesLoadingState extends UpcomingMoviesStates {}

class UpcomingMoviesLoadedState extends UpcomingMoviesStates {
  final List<Movie> movies;

  UpcomingMoviesLoadedState({required this.movies});
}

class UpcomingMoviesErrorState extends UpcomingMoviesStates {
  final String errorMessage;

  UpcomingMoviesErrorState({required this.errorMessage});
}
