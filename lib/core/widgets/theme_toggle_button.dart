import 'package:clean_movies_app/features/theme/domain/entities/app_theme_mode.dart';
import 'package:clean_movies_app/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:clean_movies_app/features/theme/presentation/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.mode == AppThemeMode.dark;

        return IconButton(
          onPressed: () {
            context.read<ThemeCubit>().changeTheme(
              isDark ? AppThemeMode.light : AppThemeMode.dark,
            );
          },
          icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        );
      },
    );
  }
}
