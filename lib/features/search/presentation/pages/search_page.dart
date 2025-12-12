import 'package:clean_movies_app/core/di/service_locator.dart';
import 'package:clean_movies_app/core/widgets/movie_card_widget.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_state.dart';
import 'package:clean_movies_app/features/search/presentation/widgets/search_text_field_widget.dart';
import 'package:clean_movies_app/generated/l10n.dart';
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

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _scrollController = ScrollController();
  String currentQuery = "";

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<SearchCubit>();

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          cubit.state.hasMore &&
          (cubit.state is! SearchLoadingMoreState)) {
        cubit.loadMore(currentQuery);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).search,
          style: theme.textTheme.headlineMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextFieldWidget(
                onChanged: (value) {
                  currentQuery = value;
                  context.read<SearchCubit>().loadSearchMovies(value);
                },
              ),
              const SizedBox(height: 25),
              BlocBuilder<SearchCubit, SearchState>(
                buildWhen: (prev, next) {
                  if (next is SearchLoadingMoreState) return false;
                  return true;
                },
                builder: (context, state) {
                  if (state is SearchLoadingState) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is SearchErrorState && state.movies.isEmpty) {
                    return Expanded(
                      child: Center(child: Text(state.errorMessage)),
                    );
                  }

                  if (state is SearchLoadedState) {
                    return Expanded(
                      child: ListView.separated(
                        controller: _scrollController,
                        itemCount:
                            state.movies.length +
                            (state is SearchLoadingMoreState ? 1 : 0),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          final isLoader = index == state.movies.length;

                          if (isLoader) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }

                          final movie = state.movies[index];

                          return MovieCardWidget(
                            id: movie.id,
                            posterUrl: movie.poster ?? '',
                            title: movie.name,
                            raiting: movie.rating,
                            genre: movie.genre ?? '',
                            year: movie.year ?? 0,
                            minutes: movie.movieLength ?? 0,
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
