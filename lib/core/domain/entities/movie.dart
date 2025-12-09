import 'package:clean_movies_app/features/movies/domain/entities/actor.dart';

class Movie {
  final int id;
  final String name;
  final int year;
  final String description;
  final double rating;
  final int movieLength;
  final String poster;
  final String backdrop;
  final String genre;
  final List<Actor>? persons;

  Movie({
    required this.id,
    required this.name,
    required this.year,
    required this.description,
    required this.rating,
    required this.movieLength,
    required this.poster,
    required this.backdrop,
    required this.genre,
    this.persons,
  });
}
