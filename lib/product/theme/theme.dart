import 'package:flutter/material.dart';

// özberk : Since it will only be a dark theme, I made both of them dark
class AppTheme {
  static ThemeData lightTheme = dark;
  static ThemeData darkTheme = dark;
}

ThemeData dark = ThemeData(
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.black,
  colorSchemeSeed: Colors.blue,
);

ThemeData light = ThemeData();
