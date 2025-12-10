import 'package:clean_movies_app/features/search/data/models/search_movie_model.dart';
import 'package:dio/dio.dart';

class SearchRemoteDatasource {
  final Dio client;

  SearchRemoteDatasource({required this.client});

  Future<List<SearchMovieModel>> getSearchMovies(String query) async {
    try {
      final response = await client.get(
        '/movie/search',
        queryParameters: {'query': query},
      );
      final moviesList = (response.data['docs'] as List)
          .map((movie) => SearchMovieModel.fromJson(movie))
          .toList();

      return moviesList;
    } catch (_) {
      throw 'Ошибка получения фильмов';
    }
  }
}
