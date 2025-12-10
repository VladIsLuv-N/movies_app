import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';

abstract class SearchRepostitory {
  Future<List<SearchMovie>> getSearchMovies(String query);
}