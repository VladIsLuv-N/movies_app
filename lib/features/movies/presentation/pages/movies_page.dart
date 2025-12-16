import 'package:clean_movies_app/core/widgets/theme_toggle_button.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit/horrors_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit/horrors_movies_states.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_states.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_states.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit/upcoming_movies_states.dart';
import 'package:clean_movies_app/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/grid_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/movies_tabs.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/search_button.dart';
import 'package:clean_movies_app/features/movies/presentation/widgets/top_films_card.dart';
import 'package:clean_movies_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).homePageTitle,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 15),
              const SearchButton(),
              const SizedBox(height: 25),
              SizedBox(
                height: 300,
                child: BlocBuilder<PopularMoviesCubit, PopularMoviesStates>(
                  builder: (context, state) {
                    if (state is PopularMoviesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is PopularMoviesLoadedState) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                        itemBuilder: (context, index) {
                          return TopFilmsCard(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MovieDetailPage(
                                    id: state.movies[index].id,
                                  ),
                                ),
                              );
                            },
                            posterUrl: state.movies[index].poster,
                            number: index + 1,
                          );
                        },
                      );
                    }

                    if (state is PopularMoviesErrorState) {
                      return Center(child: Text(state.errorMessage));
                    }

                    return Container();
                  },
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: MoviesTabs(
                  tabs: [
                    S.of(context).nowPlaying,
                    S.of(context).horrors,
                    S.of(context).upcoming,
                  ],
                  children: [
                    BlocBuilder<TrendingMoviesCubit, TrendingMoviesStates>(
                      builder: (context, state) {
                        if (state is TrendingMoviesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is TrendingMoviesErrorState) {
                          return Center(child: Text(state.errorMessage));
                        }

                        if (state is TrendingMoviesLoadedState) {
                          return GridMovies(movies: state.movies);
                        }

                        return Container();
                      },
                    ),
                    BlocBuilder<HorrorsMoviesCubit, HorrorsMoviesStates>(
                      builder: (context, state) {
                        if (state is HorrorsMoviesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is HorrorsMoviesErrorState) {
                          return Center(child: Text(state.errorMessage));
                        }

                        if (state is HorrorsMoviesLoadedState) {
                          return GridMovies(movies: state.movies);
                        }

                        return Container();
                      },
                    ),
                    BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesStates>(
                      builder: (context, state) {
                        if (state is UpcomingMoviesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is UpcomingMoviesErrorState) {
                          return Center(child: Text(state.errorMessage));
                        }

                        if (state is UpcomingMoviesLoadedState) {
                          return GridMovies(movies: state.movies);
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
