import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_states.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/header_movie_details.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_info_widget.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movies_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
      builder: (context, state) {
        if (state is MovieDetailsLoadingState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is MovieDetailsLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Detail',
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderMovieDetails(
                  posterUrl: state.movie.poster,
                  backdropUrl: state.movie.backdrop,
                  raiting: state.movie.rating,
                  movieName: state.movie.name,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ).copyWith(top: 30),
                  child: MovieInfoWidget(
                    year: state.movie.year,
                    minutes: state.movie.movieLength,
                    genre: 'Action',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ).copyWith(top: 30),
                    child: MoviesTabs(
                      tabs: ['Description', 'Cast', 'Reviews'],
                      children: [
                        Text(
                          state.movie.description,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const Center(child: Text('Cast')),
                        const Center(child: Text('Reviews')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
