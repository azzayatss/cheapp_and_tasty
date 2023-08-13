import 'package:flutter/material.dart';

class AppTheme {
  AppTheme({required this.isDark});

  final bool isDark;
  ThemeData get themeData {
    return ThemeData(
      colorSchemeSeed: Colors.indigoAccent,
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
