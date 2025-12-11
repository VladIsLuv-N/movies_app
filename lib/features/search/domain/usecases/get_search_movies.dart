import 'package:clean_movies_app/features/search/domain/entities/search_query.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class GetSearchMovies {
  final SearchRepostitory repository;

  GetSearchMovies({required this.repository});

  Future<SearchQuery> call(String query, int page) async {
    return repository.getSearchMovies(query, page);
  }
}
