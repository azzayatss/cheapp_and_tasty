import 'package:cheapp_and_tasty/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme({required this.isDark});

  final bool isDark;
  ThemeData get themeData {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      colorSchemeSeed: AppColors.appSeedColor,
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
      ),
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
