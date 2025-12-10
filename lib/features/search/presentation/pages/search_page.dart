import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/core/widgets/movie_card_widget.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_state.dart';
import 'package:clean_movies_app/features/search/presentation/widgets/search_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              SearchTextFieldWidget(
                onChanged: (value) {
                  context.read<SearchCubit>().loadSearchMovies(value);
                },
              ),
              const SizedBox(height: 25),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoadingState) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is SearchErrorState) {
                    return Expanded(child: Center(child: Text(state.errorMessage)));
                  }

                  if (state is SearchLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: state.movies.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          return MovieCardWidget(
                            posterUrl: state.movies[index].poster ?? '',
                            title: state.movies[index].name,
                            raiting: state.movies[index].rating,
                            genre: state.movies[index].genre ?? '',
                            year: state.movies[index].year ?? 0,
                            minutes: state.movies[index].movieLength ?? 0,
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
