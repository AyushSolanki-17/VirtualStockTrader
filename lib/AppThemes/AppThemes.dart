import 'package:flutter/material.dart';

class AppThemes{
  static final primaryColor = Color(0xFF240784);
  static final primaryColorDark = Color(0xFF000056);
  static final primaryColorLight = Color(0xFF5C36B5);
  static final secondaryColor = Color(0xFF9BE7FF);
  static final secondaryColorDark = Color(0xFF64B5F6);
  static final secondaryColorLight = Color(0xFF2286C3);
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    primaryColor: primaryColor,
    splashColor: primaryColorDark,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
    primaryColor: primaryColor,
    splashColor: primaryColorLight,
  );
}

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn)
  {
    themeMode = isOn?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }

}