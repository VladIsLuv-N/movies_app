import 'package:clean_movies_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';
import 'package:clean_movies_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDatasource api;

  MoviesRepositoryImpl({required this.api});

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final movieModelsList = await api.getPopularMovies();
      final movies = movieModelsList.map((movie) => movie.toEntity()).toList();

      return movies;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getTrendingMovies() async {
    try {
      final movieModelsList = await api.getTrendingMovies();
      final movies = movieModelsList.map((movie) => movie.toEntity()).toList();

      return movies;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getHorrorsMovies() async {
    try {
      final movieModelsList = await api.getHorrorsMovies();
      final movies = movieModelsList.map((movie) => movie.toEntity()).toList();

      return movies;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final movieModelsList = await api.getUpcomingMovies();
      final movies = movieModelsList.map((movie) => movie.toEntity()).toList();

      return movies;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Movie> getMovie(int id) async {
    try {
      final movieModel = await api.getMovie(id);
      final movie = movieModel.toEntity();

      return movie;
    } catch (_) {
      rethrow;
    }
  }
}
