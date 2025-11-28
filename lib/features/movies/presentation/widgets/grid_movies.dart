import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/features/movies/domain/entities/movie.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_poster_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridMovies extends StatelessWidget {
  final List<Movie> movies;

  const GridMovies({super.key, required this.movies});

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (context) =>
                      getIt<MovieDetailsCubit>()..loadMovie(movies[index].id),
                  child: const MovieDetailPage(),
                ),
              ),
            );
          },
          posterUrl: movies[index].poster,
          height: 100,
        );
      },
    );
  }
}
