import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color outlineTextBg;
  final Color buttonBg;
  final Color outlineTextBorder;

  const AppColors({
    required this.outlineTextBg,
    required this.buttonBg,
    required this.outlineTextBorder,
  });

  @override
  AppColors copyWith({
    Color? outlineTextBg,
    Color? buttonBg,
    Color? outlineTextBorder,
  }) {
    return AppColors(
      outlineTextBg: outlineTextBg ?? this.outlineTextBg,
      buttonBg: buttonBg ?? this.buttonBg,
      outlineTextBorder: outlineTextBorder ?? this.outlineTextBorder,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      outlineTextBg: Color.lerp(outlineTextBg, other.outlineTextBg, t)!,
      buttonBg: Color.lerp(buttonBg, other.buttonBg, t)!,
      outlineTextBorder: Color.lerp(
        outlineTextBorder,
        other.outlineTextBorder,
        t,
      )!,
    );
  }
}
