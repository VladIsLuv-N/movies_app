import 'package:clean_movies_app/features/search/domain/entities/search_movie.dart';

class SearchMovieModel {
  final int id;
  final String name;
  final int? year;
  final double rating;
  final int? movieLength;
  final String? poster;
  final String? genre;

  SearchMovieModel({
    required this.id,
    required this.name,
    required this.year,
    required this.rating,
    required this.movieLength,
    required this.poster,
    required this.genre,
  });

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      id: json['id'] as int,
      name: json['name'] as String,
      year: json['year'] as int?,
      rating: (json['rating']['imdb'] as num).toDouble(),
      movieLength: json['movieLength'] as int?,
      poster: json['poster']['url'] as String?,
      genre: (json['genres'] as List).isNotEmpty == true
          ? (json['genres'][0]['name'] as String?)
          : null,
    );
  }

  SearchMovie toEntity() {
    return SearchMovie(
      id: id,
      name: name,
      year: year,
      rating: rating,
      movieLength: movieLength,
      poster: poster,
      genre: genre,
    );
  }
}
