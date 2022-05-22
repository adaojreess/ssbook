import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primaryColor,
    ).copyWith(secondary: AppColors.accentColor),
  );
}
