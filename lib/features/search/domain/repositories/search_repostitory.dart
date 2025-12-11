import 'package:clean_movies_app/features/search/domain/entities/search_query.dart';

abstract class SearchRepostitory {
  Future<SearchQuery> getSearchMovies(String query, int page);
}