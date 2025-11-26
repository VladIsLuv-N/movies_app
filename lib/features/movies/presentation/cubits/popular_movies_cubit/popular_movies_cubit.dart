import 'package:clean_movies_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesStates> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesCubit({required this.getPopularMovies})
    : super(PopularMoviesInitialState());

  Future<void> loadPopularMovies() async {
    emit(PopularMoviesLoadingState());

    try {
      final movies = await getPopularMovies();

      emit(PopularMoviesLoadedState(movies: movies));
    } catch (e) {
      emit(PopularMoviesErrorState(errorMessage: e.toString()));
    }
  }
}
