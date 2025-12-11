import 'package:clean_movies_app/features/search/data/models/search_movie_model.dart';
import 'package:clean_movies_app/features/search/domain/entities/search_query.dart';

class SearchQueryModel {
  final List<SearchMovieModel> movies;
  final int total;
  final int limit;
  final int page;
  final int pages;

  SearchQueryModel({
    required this.movies,
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory SearchQueryModel.fromJson(Map<String, dynamic> json) {
    return SearchQueryModel(
      movies: List<SearchMovieModel>.from(
        (json['docs'] as List).map<SearchMovieModel>(
          (movie) => SearchMovieModel.fromJson(movie as Map<String, dynamic>),
        ),
      ),
      total: json['total'] as int,
      limit: json['limit'] as int,
      page: json['page'] as int,
      pages: json['pages'] as int,
    );
  }

  SearchQuery toEntity() {
    return SearchQuery(
      movies: movies.map((movie) => movie.toEntity()).toList(),
      total: total,
      limit: limit,
      page: page,
      pages: pages,
    );
  }
}
