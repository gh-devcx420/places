import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/constants.dart';
import 'package:places/models/places_model.dart';
import 'package:places/providers/places_provider.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:places/screens/place_details_screen.dart';
import 'package:places/screens/settings_screen.dart';

class PlacesHome extends ConsumerWidget {
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

  void _showPlaceDetails(
      BuildContext context, Place currentPlace, WidgetRef ref) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceDetails(
          currentPlace: currentPlace,
          onDelete: () {
            final userPlaceListHandler = ref.read(userPlacesProvider.notifier);
            final result = userPlaceListHandler.removePlace(currentPlace);
            if (result != 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Place Deleted!'),
                  duration: Duration(
                    milliseconds: 800,
                  ),
                ),
              );
              return;
            }
            //Optional : Do something with the Result.
            //Show an appropriate Message.
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPlaceListWatcher = ref.watch(userPlacesProvider);
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    Widget bodyContent = Center(
      child: Text(
        'No Places Added Yet',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isDark
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
            ),
      ),
    );

    if (userPlaceListWatcher.isNotEmpty) {
      bodyContent = ListView(
        children: userPlaceListWatcher.map(
          (listItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: () {
                  _showPlaceDetails(context, listItem, ref);
                },
                child: ListTile(
                  leading: Container(
                    width: 60,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        width: kBorderThickness,
                      ),
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius - 2),
                      child: Image.file(
                        listItem.placeImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(left: 6),
                  visualDensity: const VisualDensity(horizontal: -4.0),
                  title: Text(
                    listItem.placeTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    '${listItem.placeLocation.areaName}.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Places',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: bodyContent,
      ),
    );
  }
}
