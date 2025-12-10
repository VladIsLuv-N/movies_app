class SearchMovie {
  final int id;
  final String name;
  final int? year;
  final double rating;
  final int? movieLength;
  final String? poster;
  final String? genre;

  SearchMovie({
    required this.id,
    required this.name,
    required this.year,
    required this.rating,
    required this.movieLength,
    required this.poster,
    required this.genre,
  });
}
