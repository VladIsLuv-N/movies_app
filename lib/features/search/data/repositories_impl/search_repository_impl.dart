import 'package:clean_movies_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:clean_movies_app/features/search/domain/entities/search_query.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class SearchRepositoryImpl implements SearchRepostitory {
  final SearchRemoteDatasource api;

  SearchRepositoryImpl({required this.api});

  @override
  Future<SearchQuery> getSearchMovies(String query, int page) async {
    try {
      final searchMovieModelsQuery = await api.getSearchMovies(query, page);
      final movies = searchMovieModelsQuery.toEntity();

      return movies;
    } catch (_) {
      rethrow;
    }
  }
}
