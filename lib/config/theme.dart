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
    );
  }
}
