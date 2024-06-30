import 'package:flutter/material.dart';
import 'package:behavior/data/preference/share_preferences_instance.dart';

class ThemeModePreference {
  static const key = "theme_mode";

  static Future<bool> setThemeMode(ThemeMode themeMode) async {
    final prefs = SharedPreferencesInstance().prefs;
    return prefs.setInt(key, themeMode.index);
  }

  static ThemeMode getThemeMode() {
    final prefs = SharedPreferencesInstance().prefs;
    final index = prefs.getInt(key) ?? ThemeMode.system.index;
    return ThemeMode.values[index];
  }
}
