import 'package:clean_movies_app/core/network/api_client.dart';
import 'package:clean_movies_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:clean_movies_app/features/movies/data/repositories_impl/movies_repository_impl.dart';
import 'package:clean_movies_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_horrors_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_movie.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_trending_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit%20copy/horrors_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit%20copy/upcoming_movies_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> initGetIt() async {
  getIt.registerLazySingleton<Dio>(
    () => ApiClient(apiKey: 'QVPJHSV-Y8V4G70-J0J9VBT-AB0Z0WP').dio,
  );

  _initMoviesFeature();
}

void _initMoviesFeature() {
  getIt.registerLazySingleton<MoviesRemoteDatasource>(
    () => MoviesRemoteDatasource(client: getIt()),
  );

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(api: getIt()),
  );

  getIt.registerLazySingleton(() => GetPopularMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetHorrorsMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetUpcomingMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetMovie(repository: getIt()));

  getIt.registerFactory(() => PopularMoviesCubit(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesCubit(getTrendingMovies: getIt()));
  getIt.registerFactory(() => HorrorsMoviesCubit(getHorrorsMovies: getIt()));
  getIt.registerFactory(() => UpcomingMoviesCubit(getUpcomingMovies: getIt()));
}
