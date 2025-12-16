import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/usecases/get_theme_mode.dart';
import 'package:clean_movies_app/features/theme/domain/usecases/set_theme_mode.dart';
import 'package:clean_movies_app/features/theme/presentation/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetThemeMode getThemeMode;
  final SetThemeMode setThemeMode;

  ThemeCubit({required this.getThemeMode, required this.setThemeMode})
    : super(ThemeState(mode: AppThemeMode.system));

  Future<void> loadTheme() async {
    final mode = await getThemeMode();

    emit(ThemeState(mode: mode));
  }

  Future<void> changeTheme(AppThemeMode mode) async {
    await setThemeMode(mode);

    emit(ThemeState(mode: mode));
  }
}
