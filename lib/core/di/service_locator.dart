import 'package:clean_movies_app/core/network/api_client.dart';
import 'package:clean_movies_app/features/movies/data/datasources/movies_remote_datasource.dart';
import 'package:clean_movies_app/features/movies/data/repositories_impl/movies_repository_impl.dart';
import 'package:clean_movies_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_horrors_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_movie.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_trending_movies.dart';
import 'package:clean_movies_app/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/horrors_movies_cubit/horrors_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'package:clean_movies_app/features/movies/presentation/cubits/upcoming_movies_cubit/upcoming_movies_cubit.dart';
import 'package:clean_movies_app/features/search/data/datasources/search_remote_datasource.dart';
import 'package:clean_movies_app/features/search/data/repositories_impl/search_repository_impl.dart';
import 'package:clean_movies_app/features/search/domain/repositories/search_repostitory.dart';
import 'package:clean_movies_app/features/search/domain/usecases/get_search_movies.dart';
import 'package:clean_movies_app/features/search/presentation/cubits/search_cubit.dart';
import 'package:clean_movies_app/features/theme/data/datasources/theme_local_datasource.dart';
import 'package:clean_movies_app/features/theme/data/repositories_impl/theme_repository_impl.dart';
import 'package:clean_movies_app/features/theme/domain/repositories/theme_repository.dart';
import 'package:clean_movies_app/features/theme/domain/usecases/get_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/usecases/set_theme_mode.dart';
import 'package:clean_movies_app/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.I;
//6JCPVNA-ZN94NP2-GXE66NZ-MT0GQRV     QVPJHSV-Y8V4G70-J0J9VBT-AB0Z0WP
Future<void> initGetIt() async {
  getIt.registerLazySingleton<Dio>(
    () => ApiClient(apiKey: '6JCPVNA-ZN94NP2-GXE66NZ-MT0GQRV').dio,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  _initMoviesFeature();
  _initSearchFeature();
  _initThemeFeature();
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
  getIt.registerFactory(() => MovieDetailsCubit(getMovie: getIt()));
}

void _initSearchFeature() {
  getIt.registerLazySingleton<SearchRemoteDatasource>(
    () => SearchRemoteDatasource(client: getIt()),
  );

  getIt.registerLazySingleton<SearchRepostitory>(
    () => SearchRepositoryImpl(api: getIt()),
  );

  getIt.registerLazySingleton(() => GetSearchMovies(repository: getIt()));

  getIt.registerFactory(() => SearchCubit(getSearchMovies: getIt()));
}

void _initThemeFeature() {
  getIt.registerLazySingleton<ThemeLocalDatasource>(
    () => ThemeLocalDatasource(prefs: getIt()),
  );

  getIt.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(local: getIt()),
  );

  getIt.registerLazySingleton(() => GetThemeMode(repository: getIt()));
  getIt.registerLazySingleton(() => SetThemeMode(repository: getIt()));

  getIt.registerFactory(
    () => ThemeCubit(getThemeMode: getIt(), setThemeMode: getIt()),
  );
}
