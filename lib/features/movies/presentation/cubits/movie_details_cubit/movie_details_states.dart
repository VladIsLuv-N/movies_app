import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';

class MovieDetailsStates {}

class MovieDetailsInitialState extends MovieDetailsStates {}

class MovieDetailsLoadingState extends MovieDetailsStates {}

class MovieDetailsLoadedState extends MovieDetailsStates {
  final Movie movie;

  MovieDetailsLoadedState({required this.movie});
}

class MovieDetailsErrorState extends MovieDetailsStates {
  final String errorMessage;

  MovieDetailsErrorState({required this.errorMessage});
}
