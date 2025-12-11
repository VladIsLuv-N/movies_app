import 'package:clean_movies_app/features/search/data/models/search_query_model.dart';
import 'package:dio/dio.dart';

class SearchRemoteDatasource {
  final Dio client;

  SearchRemoteDatasource({required this.client});

  Future<SearchQueryModel> getSearchMovies(String query, int page) async {
    try {
      final response = await client.get(
        '/movie/search',
        queryParameters: {'query': query, 'page': page},
      );
      final movies = SearchQueryModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      return movies;
    } catch (_) {
      throw 'Ошибка получения фильмов';
    }
  }
}
