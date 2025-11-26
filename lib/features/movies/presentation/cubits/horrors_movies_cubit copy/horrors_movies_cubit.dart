import 'package:clean_movies_app/features/movies/domain/usecases/get_horrors_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit%20copy/horrors_movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorrorsMoviesCubit extends Cubit<HorrorsMoviesStates> {
  final GetHorrorsMovies getHorrorsMovies;

  HorrorsMoviesCubit({required this.getHorrorsMovies})
    : super(HorrorsMoviesInitialState());

  Future<void> loadHorrorsMovies() async {
    emit(HorrorsMoviesLoadingState());

    try {
      final movies = await getHorrorsMovies();

      emit(HorrorsMoviesLoadedState(movies: movies));
    } catch (e) {
      emit(HorrorsMoviesErrorState(errorMessage: e.toString()));
    }
  }
}
