import 'package:clean_movies_app/features/movies/domain/usecases/get_movie.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  final GetMovie getMovie;

  MovieDetailsCubit({required this.getMovie})
    : super(MovieDetailsInitialState());

  Future<void> loadMovie(int id) async {
    emit(MovieDetailsLoadingState());

    try {
      final movie = await getMovie(id);

      emit(MovieDetailsLoadedState(movie: movie));
    } catch (e) {
      emit(MovieDetailsErrorState(errorMessage: e.toString()));
    }
  }
}
