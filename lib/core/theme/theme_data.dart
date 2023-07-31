import 'package:flutter/material.dart';

// Constants for App theme data
const String kFontFamily = "Nunito";

final kLightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffEEF5FF),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
  ),
  fontFamily: kFontFamily,
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
  ),
  fontFamily: kFontFamily,
);
