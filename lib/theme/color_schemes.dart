import 'package:flutter/material.dart';
import 'package:places/models/theme_models.dart';

enum ThemeName {
  limeForest,
  oceanBlue,
}

Map<ThemeName, AppThemeItem> placesThemes = {
  ThemeName.limeForest: AppThemeItem(
    colorScheme: AppColorScheme.limeForest,
    identifier: 'Lime Forest',
  ),
  ThemeName.oceanBlue: AppThemeItem(
    colorScheme: AppColorScheme.oceanBlue,
    identifier: 'Ocean Depths',
  ),
};

abstract class AppColorScheme {
  static ThemeColorScheme limeForest = const ThemeColorScheme(
    light: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF8EC649),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFABE065),
      onPrimaryContainer: Color(0xFF1A1C18),
      secondary: Color(0xFF006641),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF90F1BD),
      onSecondaryContainer: Color(0xFF002113),
      tertiary: Color(0xFFFFD100),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFFFFE563),
      onTertiaryContainer: Color(0xFF1A1600),
      surface: Color(0xFFF3FFE7),
      onSurface: Color(0xFF1A1C18),
      surfaceDim: Color(0xFFDBDDD7),
      surfaceBright: Color(0xFFFCFDF6),
      error: Color(0xFFB04F4A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFF9DEDC),
      onErrorContainer: Color(0xFF410E0B),
      outline: Color(0xFF74796D),
      shadow: Color(0xFF000000),
      inverseSurface: Color(0xFF2F312D),
      onInverseSurface: Color(0xFFF1F1EB),
      inversePrimary: Color(0xFF8EC649),
    ),
    dark: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF17473B),
      onPrimary: Color(0xFFCFF6EC),
      primaryContainer: Color(0xFF006641),
      onPrimaryContainer: Color(0xFFC3EC89),
      secondary: Color(0xFF005235),
      onSecondary: Color(0xFFE2E2DC),
      secondaryContainer: Color(0xFF17473B),
      onSecondaryContainer: Color(0xFF90F1BD),
      tertiary: Color(0xFF006641),
      onTertiary: Color(0xFFE2E2DC),
      tertiaryContainer: Color(0xFF004B31),
      onTertiaryContainer: Color(0xFF74F9AE),
      surface: Color(0xFF000000),
      onSurface: Color(0xFFE2E2DC),
      surfaceDim: Color(0xFF000000),
      surfaceBright: Color(0xFF000000),
      error: Color(0xFF8C1D18),
      onError: Color(0xFFE2E2DC),
      errorContainer: Color(0xFF601410),
      onErrorContainer: Color(0xFFF9DEDC),
      outline: Color(0xFF899387),
      shadow: Color(0xFF000000),
      inverseSurface: Color(0xFFE2E2DC),
      onInverseSurface: Color(0xFF000000),
      inversePrimary: Color(0xFF17473B),
    ),
  );

  static ThemeColorScheme oceanBlue = const ThemeColorScheme(
    light: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF6EB4F1),
      // Light blue from palette
      onPrimary: Color(0xFFFFFFFF),
      // Deep blue for contrast
      primaryContainer: Color(0xFFB0C4DE),
      // Lightest blue from palette
      onPrimaryContainer: Color(0xFF002952),
      // Darker shade for contrast
      secondary: Color(0xFF002952),
      // Medium-light blue from palette
      onSecondary: Color(0xFFFFFFFF),
      // Dark blue for contrast
      secondaryContainer: Color(0xFFD8E6F7),
      // Very light blue
      onSecondaryContainer: Color(0xFF002952),
      // Dark blue for contrast
      tertiary: Color(0xFF89A7D3),
      // Medium-light blue-grey
      onTertiary: Color(0xFF002952),
      // Dark blue for contrast
      tertiaryContainer: Color(0xFFE5EEF9),
      // Very light blue-grey
      onTertiaryContainer: Color(0xFF002952),
      // Dark blue for contrast
      surface: Color(0xFFFBFCFE),
      // Nearly white
      onSurface: Color(0xFF001B3D),
      // Very dark blue
      surfaceDim: Color(0xFFE1E2EC),
      // Dimmed surface
      surfaceBright: Color(0xFFFBFCFF),
      // Bright surface
      error: Color(0xFFBA1A1A),
      // Standard error red
      onError: Color(0xFFFFFFFF),
      // White for contrast
      errorContainer: Color(0xFFFFDAD6),
      // Light error container
      onErrorContainer: Color(0xFF410002),
      // Dark error text
      outline: Color(0xFF74777F),
      // Subtle outline
      shadow: Color(0xFF000000),
      // Standard shadow
      inverseSurface: Color(0xFF002B5B),
      // Darker blue
      onInverseSurface: Color(0xFFE5E5E5),
      // Light grey
      inversePrimary: Color(0xFF003366), // Deep blue from palette
    ),
    dark: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF003366),
      onPrimary: Color(0xFFD3E4FF),
      primaryContainer: Color(0xFF002952),
      onPrimaryContainer: Color(0xFFD3E4FF),
      secondary: Color(0xFF2A5298),
      onSecondary: Color(0xFFD3E4FF),
      secondaryContainer: Color(0xFF1B3B6F),
      onSecondaryContainer: Color(0xFFD5E3FF),
      tertiary: Color(0xFF1F4580),
      onTertiary: Color(0xFFD3E4FF),
      tertiaryContainer: Color(0xFF15325E),
      onTertiaryContainer: Color(0xFFD6E4FF),
      surface: Color(0xFF000000),
      onSurface: Color(0xFFE2E2FF),
      surfaceDim: Color(0xFF001B3D),
      surfaceBright: Color(0xFF233344),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFB4AB),
      outline: Color(0xFF8D9199),
      shadow: Color(0xFF000000),
      inverseSurface: Color(0xFFE5E5E5),
      onInverseSurface: Color(0xFF001B3D),
      inversePrimary: Color(0xFF6EB4F1),
    ),
  );
}
