import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_controller.g.dart';

@riverpod
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode? build() {
    return ThemeMode.system;
  }

  void switchToLightTheme() {
    state = ThemeMode.light;
  }

  void switchToDarkTheme() {
    state = ThemeMode.dark;
  }

  void switchToSystemTheme() {
    state = ThemeMode.system;
  }
}
