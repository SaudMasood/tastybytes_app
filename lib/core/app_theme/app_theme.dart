import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.black,

    colorScheme: const ColorScheme.light(
      primary: AppColors.black,
      secondary: AppColors.yellow,
      surface: AppColors.white,
      error: AppColors.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
      ),
    ),

    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 2,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGrey,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.black,

    primaryColor: AppColors.white,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.white,
      secondary: AppColors.yellow,
      surface: AppColors.darkGrey,
      error: AppColors.error,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
      ),
    ),

    cardTheme: const CardThemeData(
      color: AppColors.darkGrey,
      elevation: 2,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGrey,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
    ),
  );
}