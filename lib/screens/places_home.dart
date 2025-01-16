import 'package:flutter/material.dart';
import 'package:places/screens/settings.dart';
import 'package:places/theme/color_schemes.dart';

class PlacesHome extends StatelessWidget {
  const PlacesHome({super.key, required this.onThemeTap});

  final Function(ThemeName) onThemeTap;

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Settings(onTap: onThemeTap),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Places',
        ),
        actions: [
          IconButton(
            onPressed: () {
              _openSettings(context);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
