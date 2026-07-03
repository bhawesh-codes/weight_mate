import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  bool? _isDark;
  get isDark => _isDark;

  ThemeData? _themeData;
  get themeData => _themeData;

  // ThemeManager() {
  //   isDarkMode().then((value) {
  //     _themeData = value ? AppTheme.appThemeDark : AppTheme.appThemeLight;
  //     notifyListeners();
  //   });
  // }

  // Future<bool> isDarkMode() async {
  //   // _isDark = await CacheRepo.storage.isDarkMode();
  //   // return _isDark ?? false;
  // }

  void toggleDarkMode() async {
    if (_isDark != null) {
      if (_isDark!) {
        _isDark = false;
      } else {
        _isDark = true;
      }
    }
    // _themeData = isDark ? AppTheme.appThemeDark : AppTheme.appThemeLight;
    // await CacheRepo.storage.saveDarkModeStatus(isDark);
    // notifyListeners();
  }
}
