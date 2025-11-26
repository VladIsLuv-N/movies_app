import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String name;
  final int year;
  final String description;
  final double rating;
  final int movieLength;
  final String poster;
  final String backdrop;
  final String genre;

  MovieModel({
    required this.id,
    required this.name,
    required this.year,
    required this.description,
    required this.rating,
    required this.movieLength,
    required this.poster,
    required this.backdrop,
    required this.genre,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      name: json['name'] as String,
      year: json['year'] as int,
      description: json['description'] as String,
      rating: (json['rating']['imdb'] as num).toDouble(),
      movieLength: json['movieLength'] as int,
      poster: json['poster']['url'] as String,
      backdrop: json['backdrop']['url'] as String,
      genre: (json['genres'] as List)[0]['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'year': year,
      'description': description,
      'rating': rating,
      'movieLength': movieLength,
      'poster': poster,
      'backdrop': backdrop,
      'genre': genre,
    };
  }

  Movie toEntity() {
    return Movie(
      id: id,
      name: name,
      year: year,
      description: description,
      rating: rating,
      movieLength: movieLength,
      poster: poster,
      backdrop: backdrop,
      genre: genre,
    );
  }
}
