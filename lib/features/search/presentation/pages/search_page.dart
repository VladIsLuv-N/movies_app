import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/core/widgets/movie_card_widget.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_state.dart';
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
              TextField(
                onChanged: (value) {
                  context.read<SearchCubit>().loadSearchMovies(value);
                },
                autofocus: true,
                cursorColor: Colors.white,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  hintStyle: theme.textTheme.labelMedium,
                  suffixIcon: const ImageIcon(
                    AssetImage('assets/icons/search.png'),
                    color: Color(0xFF67686D),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF3A3F47),
                ),
              ),
              const SizedBox(height: 25),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }

                  if (state is SearchLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: state.movies.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          return MovieCardWidget(
                            posterUrl: state.movies[index].poster,
                            title: state.movies[index].name,
                            raiting: state.movies[index].rating,
                            genre: state.movies[index].genre,
                            year: state.movies[index].year,
                            minutes: state.movies[index].movieLength,
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
