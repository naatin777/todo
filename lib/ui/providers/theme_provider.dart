import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/preference/theme_mode_preference.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider(ThemeMode themeMode) : super(themeMode);

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await ThemeModePreference.setThemeMode(themeMode);
  }
}

final themeProviderFamily =
    StateNotifierProvider.family<ThemeProvider, ThemeMode, ThemeMode>(
        (ref, themeMode) => ThemeProvider(themeMode));

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>(
    (ref) => throw UnimplementedError());
