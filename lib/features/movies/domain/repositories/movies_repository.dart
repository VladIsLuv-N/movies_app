import 'package:clean_movies_app/core/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getTrendingMovies();

  Future<List<Movie>> getHorrorsMovies();
  
  Future<List<Movie>> getUpcomingMovies();

  Future<Movie> getMovie(int id);
}
