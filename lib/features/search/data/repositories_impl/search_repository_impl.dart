import 'package:clean_movies_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class SearchRepositoryImpl implements SearchRepostitory {
  final SearchRemoteDatasource api;

  SearchRepositoryImpl({required this.api});

  @override
  Future<List<SearchMovie>> getSearchMovies(String query) async {
    final searchMovieModelsList = await api.getSearchMovies(query);
    final movies = searchMovieModelsList
        .map((movie) => movie.toEntity())
        .toList();

    return movies;
  }
}
