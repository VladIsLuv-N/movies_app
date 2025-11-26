import 'package:clean_movies_app/features/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDatasource {
  final Dio client;

  MoviesRemoteDatasource({required this.client});

  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      '/movie?list=top250&notNullFields=top250&sortField=top250&sortType=1&type=movie&limit=30',
    );
    final moviesList = (response.data['docs'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return moviesList;
  }

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      '/movie?type=movie&year=2025&notNullFields=name&notNullFields=poster.url&notNullFields=backdrop.url&notNullFields=ageRating&notNullFields=movieLength&limit=30',
    );
    final moviesList = (response.data['docs'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return moviesList;
  }

  Future<List<MovieModel>> getHorrorsMovies() async {
    final response = await client.get(
      '/movie?type=movie&year=2025&notNullFields=name&notNullFields=poster.url&notNullFields=backdrop.url&notNullFields=ageRating&notNullFields=movieLength&limit=30',
    );
    final moviesList = (response.data['docs'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return moviesList;
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await client.get(
      '/movie?type=movie&year=2025&notNullFields=name&notNullFields=poster.url&notNullFields=backdrop.url&notNullFields=ageRating&notNullFields=movieLength&limit=30',
    );
    final moviesList = (response.data['docs'] as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();

    return moviesList;
  }

  Future<MovieModel> getMovie(int id) async {
    final response = await client.get('/movie/$id');
    final movie = MovieModel.fromJson(response.data);

    return movie;
  }
}
