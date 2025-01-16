import 'package:flutter/material.dart';
import 'package:places/theme/color_schemes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.onTap});

  final Function(ThemeName) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Choose Theme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: placesThemes.length,
          itemBuilder: (context, index) {
            final themeItem = placesThemes.entries.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      themeItem.value.colorScheme.light.secondary,
                      themeItem.value.colorScheme.light.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    themeItem.value.identifier,
                    style: const TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    onTap(themeItem.key);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
