import 'package:clean_movies_app/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit/upcoming_movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesStates> {
  final GetUpcomingMovies getUpcomingMovies;

  UpcomingMoviesCubit({required this.getUpcomingMovies})
    : super(UpcomingMoviesInitialState());

  Future<void> loadUpcomingMovies() async {
    emit(UpcomingMoviesLoadingState());

    try {
      final movies = await getUpcomingMovies();

      emit(UpcomingMoviesLoadedState(movies: movies));
    } catch (e) {
      emit(UpcomingMoviesErrorState(errorMessage: e.toString()));
    }
  }
}
