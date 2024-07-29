import 'package:flutter/material.dart';
import 'package:peak_mates/core/services/injection_container.dart';
import 'package:peak_mates/core/utilities/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    initTheme();
  }
  final prefs = sl<SharedPreferences>();

  initTheme() async {
    bool? isDarkTheme = prefs.getBool('isDarkTheme');
    if (isDarkTheme == null || isDarkTheme) {
      _themeData = AppTheme.darkTheme;
    } else {
      _themeData = AppTheme.lightTheme;
    }
    notifyListeners();
  }

  static ThemeData _themeData = AppTheme.darkTheme;
  bool get isDarkMode => themeData == AppTheme.darkTheme;

  static ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = AppTheme.lightTheme;
    } else {
      _themeData = AppTheme.darkTheme;
    }
    prefs.setBool('isDarkTheme', isDarkMode);
    notifyListeners();
  }
}
