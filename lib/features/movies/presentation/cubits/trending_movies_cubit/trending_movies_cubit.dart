import 'package:clean_movies_app/features/movies/domain/usecases/get_trending_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesStates> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesCubit({required this.getTrendingMovies})
    : super(TrendingMoviesInitialState());

  Future<void> loadTrendingMovies() async {
    emit(TrendingMoviesLoadingState());

    try {
      final movies = await getTrendingMovies();

      emit(TrendingMoviesLoadedState(movies: movies));
    } catch (e) {
      emit(TrendingMoviesErrorState(errorMessage: e.toString()));
    }
  }
}
