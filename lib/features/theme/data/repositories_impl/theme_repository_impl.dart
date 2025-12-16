import 'package:clean_movies_app/features/theme/data/datasources/theme_local_datasource.dart';
import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource local;

  ThemeRepositoryImpl({required this.local});

  @override
  Future<AppThemeMode> getThemeMode() async {
    final value = await local.getTheme();

    switch (value) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      default:
        return AppThemeMode.system;
    }
  }

  @override
  Future<void> setThemeMode(AppThemeMode mode) {
    return local.saveTheme(mode.name);
  }
}
