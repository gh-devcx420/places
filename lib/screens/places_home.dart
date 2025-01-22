import 'package:flutter/material.dart';
import 'package:places/screens/add_place.dart';
import 'package:places/screens/settings.dart';

class PlacesHome extends StatelessWidget {
  const PlacesHome({
    super.key,
  });

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Settings(),
      ),
    );
  }

  void _addPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPlace(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(),
    );
  }
}
