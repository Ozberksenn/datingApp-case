import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../features/widgets/radius.dart';

// özberk : Since it will only be a dark theme, I made both of them dark
class AppTheme {
  static ThemeData lightTheme = dark;
  static ThemeData darkTheme = dark;
}

ThemeData dark = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: AppColors.grey,
    border: OutlineInputBorder(borderRadius: CustomRadius.radius20),
    focusedBorder: OutlineInputBorder(
      borderRadius: CustomRadius.radius20,
      borderSide: BorderSide(color: AppColors.white, width: 1),
    ),
    suffixIconColor: AppColors.white,
    hintStyle: TextStyle(fontSize: 14, color: AppColors.lightGrey),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(color: Colors.white),
    displayMedium: TextStyle(color: Colors.white),
    displaySmall: TextStyle(color: Colors.white),
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white),
    headlineSmall: TextStyle(color: Colors.white),
    titleLarge: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(fontSize: 16, color: Colors.white),
    labelMedium: TextStyle(fontSize: 14, color: Colors.white),
    labelSmall: TextStyle(fontSize: 12, color: Colors.white),
  ),
);

ThemeData light = ThemeData();
