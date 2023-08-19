import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  // single pattern
  // observable pattern
  ThemeMode currentTheme = ThemeMode.dark;
  String currentLocal = "en";

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;
    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackground() {
    return currentTheme == ThemeMode.dark
        ? 'assets/images/dark_bg.png'
        : 'assets/images/default_bg.png';
  }

  void changeLanguage(String newLang) {
    if (currentLocal == newLang) return;
    currentLocal = newLang;
    notifyListeners();
  }
}
