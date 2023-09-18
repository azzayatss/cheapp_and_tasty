import 'package:cheapp_and_tasty/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      colorSchemeSeed: AppColors.appSeedColor,
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: Colors.indigoAccent,
        ),
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
      ),
    );
  }

  ThemeData get themeDataDark {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      colorSchemeSeed: AppColors.appSeedColor,
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: Colors.indigoAccent,
        ),
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
      ),
    );
  }
}
