import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Movie> movies;

  SearchLoadedState({required this.movies});
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState({required this.errorMessage});
}
