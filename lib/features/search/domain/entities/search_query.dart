import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';

class SearchQuery {
  final List<SearchMovie> movies;
  final int total;
  final int limit;
  final int page;
  final int pages;

  SearchQuery({
    required this.movies,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });
}
