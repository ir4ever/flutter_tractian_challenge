import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData get themeDefault {
    return ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: AppColors.blue, primary: AppColors.blue, secondary: AppColors.darkBlue),
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w500),
          labelLarge: TextStyle(fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400),
          headlineSmall: TextStyle(fontSize: 18, color: AppColors.gray, fontWeight: FontWeight.w500)),
      useMaterial3: true,
    );
  }
}
