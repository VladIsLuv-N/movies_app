import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required String apiKey})
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.kinopoisk.dev/v1.4/',
          headers: {'X-API-KEY': apiKey},
        ),
      );
}
