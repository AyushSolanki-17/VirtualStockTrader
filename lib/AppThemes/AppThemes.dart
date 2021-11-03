import 'package:flutter/material.dart';

class AppThemes{
  static final primaryColor = Color(0xFF1C416D);
  static final primaryColorDark = Color(0xFF001B42);
  static final primaryColorLight = Color(0xFF4E6C9C);
  static final secondaryColor = Color(0xFF2ab8f5);
  static final secondaryColorDark = Color(0xFF0088c2);
  static final secondaryColorLight = Color(0xFF73eaff);
  static final lightColor = Color(0xFFFCFCFC);
  static final darkColor = Color(0xFF111111);
  static final sunGlow = Color(0xFFFFD12E);
  static final athensGray = Color(0xFFF9F9FA);
  static final dodgerBlue = Color(0xFF2AB8F5);
  static final chateauGreen = Color(0xFF41BA63);
  static final pomegranate = Color(0xFFF63636);
  static final burntSienna = Color(0xFFED6666);
  static final burningOrange = Color(0xFFff6d3f);
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightColor,
    colorScheme: ColorScheme.light(),
    primaryColor: primaryColor,
    splashColor: primaryColorDark,
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkColor,
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