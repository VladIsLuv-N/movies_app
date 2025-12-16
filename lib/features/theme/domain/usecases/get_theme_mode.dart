import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/repositories/theme_repository.dart';

class GetThemeMode {
  final ThemeRepository repository;

  GetThemeMode({required this.repository});

  Future<AppThemeMode> call() {
    return repository.getThemeMode();
  }
}
