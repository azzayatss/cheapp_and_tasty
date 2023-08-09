import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData {
    return ThemeData(
      colorSchemeSeed: Colors.indigoAccent,
      useMaterial3: true,
      brightness: Brightness.dark,
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
