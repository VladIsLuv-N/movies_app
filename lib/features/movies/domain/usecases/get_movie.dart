import 'package:clean_movies_app/core/domain/entities/movie.dart';
import 'package:clean_movies_app/features/movies/domain/repositories/movies_repository.dart';

class GetMovie {
  final MoviesRepository repository;

  GetMovie({required this.repository});

  Future<Movie> call(int id) async {
    return repository.getMovie(id);
  }
}
