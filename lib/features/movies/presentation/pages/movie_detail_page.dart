import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_states.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/header_movie_details.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movie_info_widget.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movies_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsCubit>()..loadMovie(id),
      child: const _MovieDetailView(),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  const _MovieDetailView();

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

        if (state is MovieDetailsErrorState) {
          return Scaffold(body: Center(child: Text(state.errorMessage)));
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
                      vertical: 30,
                    ),
                    child: MoviesTabs(
                      tabs: ['Description', 'Cast', 'Reviews'],
                      children: [
                        SingleChildScrollView(
                          child: Text(
                            state.movie.description,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        state.movie.persons != null
                            ? GridView.builder(
                                itemCount: state.movie.persons?.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 30,
                                    ),
                                itemBuilder: (context, index) => SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey.withValues(
                                          alpha: 0.1,
                                        ),
                                        radius: 50,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                              state.movie.persons![index].photo,
                                            ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        state.movie.persons![index].name ?? '',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const Center(child: Text('No actors')),
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
