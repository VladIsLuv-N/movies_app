import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';

class GetSearchMovies {
  final SearchRepostitory repository;

  GetSearchMovies({required this.repository});

  Future<List<SearchMovie>> call(String query) async {
    return repository.getSearchMovies(query);
  }
}
