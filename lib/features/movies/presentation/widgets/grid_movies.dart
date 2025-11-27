import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_poster_widget.dart';
import 'package:flutter/material.dart';

class GridMovies extends StatelessWidget {
  final List<Movie> movies;
  final void Function()? onTap;

  const GridMovies({super.key, required this.movies, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) {
        return MoviePosterWidget(
          onTap: onTap,
          posterUrl: movies[index].poster,
          height: 100,
        );
      },
    );
  }
}
