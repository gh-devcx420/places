import 'package:flutter/material.dart';
import 'package:places/screens/places_home.dart';
import 'package:places/theme/color_schemes.dart';
import 'package:places/theme/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Places());
}

class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  late ColorScheme lightColorScheme = AppColorScheme.limeForest.light;
  late ColorScheme darkColorScheme = AppColorScheme.limeForest.dark;
  late SharedPreferences prefs;

  Future<void> _storeThemePreferences(ThemeName currentTheme) async {
    final prefs = await SharedPreferences.getInstance();
    if (placesThemes[currentTheme] != null) {
      prefs.setString('CurrentTheme', placesThemes[currentTheme]!.identifier);
    } else {
      prefs.setString(
          'CurrentTheme', placesThemes[ThemeName.limeForest]!.identifier);
    }
  }

  Future<void> _loadThemePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? storedThemeId = prefs.getString('CurrentTheme');
    if (storedThemeId == null) {
      _setNewTheme(ThemeName.limeForest);
      return;
    }
    ThemeName currentTheme = placesThemes.entries.firstWhere((item) {
      return item.value.identifier == storedThemeId;
    }).key;
    _setNewTheme(currentTheme);
  }

  void _setNewTheme(ThemeName newTheme) {
    setState(() {
      lightColorScheme = placesThemes[newTheme]!.colorScheme.light;
      darkColorScheme = placesThemes[newTheme]!.colorScheme.dark;
      _storeThemePreferences(newTheme);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadThemePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(lightColorScheme),
      darkTheme: AppTheme.darkTheme(darkColorScheme),
      home: PlacesHome(
        onThemeTap: _setNewTheme,
      ),
    );
  }
}
