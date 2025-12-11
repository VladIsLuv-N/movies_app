import 'package:clean_movies_app/features/search/domain/usecases/get_search_movies.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchMovies getSearchMovies;

  int _currentPage = 1;
  int _totalPages = 1;

  SearchCubit({required this.getSearchMovies}) : super(SearchInitialState());

  Future<void> loadSearchMovies(String query) async {
    emit(SearchLoadingState());

    _currentPage = 1;

    try {
      final searchQuery = await getSearchMovies(query, _currentPage);
      _totalPages = searchQuery.pages;

      emit(
        SearchLoadedState(
          movies: searchQuery.movies,
          hasMore: _currentPage < _totalPages,
        ),
      );
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> loadMore(String query) async {
    if (state is SearchLoadingMoreState) return;
    if (!state.hasMore) return;

    emit(SearchLoadingMoreState(movies: state.movies, hasMore: state.hasMore));

    try {
      _currentPage++;

      final result = await getSearchMovies(query, _currentPage);
      final updated = [...state.movies, ...result.movies];

      emit(
        SearchLoadedState(movies: updated, hasMore: _currentPage < _totalPages),
      );
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString(), movies: state.movies));
    }
  }
}
