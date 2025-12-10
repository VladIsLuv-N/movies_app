import 'package:clean_movies_app/core/domain/entities/movie.dart';
import 'package:clean_movies_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class SearchRepositoryImpl implements SearchRepostitory {
  final SearchRemoteDatasource api;

  SearchRepositoryImpl({required this.api});

  @override
  Future<List<Movie>> getSearchMovies(String query) async {
    final movieModelsList = await api.getSearchMovies(query);
    final movies = movieModelsList.map((movie) => movie.toEntity()).toList();

    return movies;
  }
}
