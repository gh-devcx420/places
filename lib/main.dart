import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/providers/settings_provider.dart';
import 'package:places/screens/home_screen.dart';
import 'package:places/theme/theme_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const Places(),
    ),
  );
}

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<Places> createState() => _PlacesState();
}

class _PlacesState extends ConsumerState<Places> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeModeWatcher = ref.watch(colorSchemesProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(
        themeModeWatcher[ThemeMode.light]!,
      ),
      darkTheme: AppTheme.darkTheme(
        themeModeWatcher[ThemeMode.dark]!,
      ),
      home: const PlacesHome(),
    );
  }
}
