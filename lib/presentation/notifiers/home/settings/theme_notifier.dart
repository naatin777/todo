import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:behavior/data/preference/theme_mode_preference.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    return ThemeModePreference.getThemeMode();
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await ThemeModePreference.setThemeMode(themeMode);
  }
}
