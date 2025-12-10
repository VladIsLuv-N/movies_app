import 'package:clean_movies_app/core/domain/entities/movie.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class GetSearchMovies {
  final SearchRepostitory repository;

  GetSearchMovies({required this.repository});

  Future<List<Movie>> call(String query) async {
    return repository.getSearchMovies(query);
  }
}
