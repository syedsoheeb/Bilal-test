import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF107C10);
  static const Color secondary = Color(0xFF5B874B);
  static const Color accent = Color(0xFF8CBD8C);
  static const Color background = Color(0xFFF5F5F5);
  static const Color foreground = Color(0xFF333333);
  static const Color success = Color(0xFF28a745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.secondary, 
      hintColor: AppColors.accent,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.background,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      ),
      fontFamily: 'Roboto',
    );
  }
}
