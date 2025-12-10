import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class SearchRepostitory {
  Future<List<Movie>> getSearchMovies(String query);
}