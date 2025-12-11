import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';

abstract class SearchState {
  final List<SearchMovie> movies;
  final bool hasMore;

  SearchState({this.movies = const [], this.hasMore = true});
}

class SearchInitialState extends SearchState {
  SearchInitialState() : super();
}

class SearchLoadingState extends SearchState {
  SearchLoadingState() : super();
}

class SearchLoadedState extends SearchState {
  SearchLoadedState({required List<SearchMovie> movies, required bool hasMore})
    : super(movies: movies, hasMore: hasMore);
}

class SearchLoadingMoreState extends SearchState {
  SearchLoadingMoreState({
    required List<SearchMovie> movies,
    required bool hasMore,
  }) : super(movies: movies, hasMore: hasMore);
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState({
    required this.errorMessage,
    List<SearchMovie> movies = const [],
    bool hasMore = true,
  }) : super(movies: movies, hasMore: hasMore);
}
