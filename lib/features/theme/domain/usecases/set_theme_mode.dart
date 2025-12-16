import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/repositories/theme_repository.dart';

class SetThemeMode {
  final ThemeRepository repository;

  SetThemeMode({required this.repository});

  Future<void> call(AppThemeMode mode) {
    return repository.setThemeMode(mode);
  }
}
