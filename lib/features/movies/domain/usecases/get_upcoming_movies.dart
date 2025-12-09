import 'package:clean_movies_app/core/domain/entities/movie.dart';
import 'package:clean_movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetUpcomingMovies {
  final MoviesRepository repository;

  GetUpcomingMovies({required this.repository});

  Future<List<Movie>> call() async {
    return repository.getUpcomingMovies();
  }
}