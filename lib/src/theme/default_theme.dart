import 'package:desafio_studio_sol/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        primaryColor: AppColors.primaryColor,
        primarySwatch: AppColors.primaryColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColors.primaryColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primaryColor,
        ).copyWith(
          secondary: AppColors.accentColor.withOpacity(1),
        ),
      );
}
