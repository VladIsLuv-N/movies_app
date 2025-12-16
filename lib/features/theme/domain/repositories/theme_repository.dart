import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();

  Future<void> setThemeMode(AppThemeMode mode);
}
