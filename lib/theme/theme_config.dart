import 'package:flutter/material.dart';

abstract class AppTheme {
  static lightTheme(ColorScheme colorScheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        titleTextStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.surface,
        ),
        actionsIconTheme: IconThemeData(
          color: colorScheme.surface,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.surface,
      ),
    );
  }

  static darkTheme(ColorScheme colorScheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        titleTextStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onPrimary,
        ),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onPrimary,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }
}
