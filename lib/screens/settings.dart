import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/theme/color_schemes.dart';

import '../providers/settings_provider.dart';

class Settings extends ConsumerWidget {
  const Settings({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeHandler = ref.watch(themeProvider.notifier);
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
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: themeItem.value.colorScheme.light.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    // onTap(themeItem.key);
                    themeHandler.setNewTheme(themeItem.key);
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
