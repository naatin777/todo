import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModePreference {
  static const key = "theme_mode";

  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, themeMode.index);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(key) ?? ThemeMode.system.index;
    return ThemeMode.values[index];
  }
}
