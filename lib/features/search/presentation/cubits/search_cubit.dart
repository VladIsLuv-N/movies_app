import 'package:clean_movies_app/features/search/domain/usecases/get_search_movies.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchMovies getSearchMovies;

  SearchCubit({required this.getSearchMovies}) : super(SearchInitialState());

  Future<void> loadSearchMovies(String query) async {
    try {
      emit(SearchLoadingState());

      final movies = await getSearchMovies(query);

      emit(SearchLoadedState(movies: movies));
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}
