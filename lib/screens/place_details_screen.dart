import 'package:flutter/material.dart';
import 'package:places/models/places_model.dart';
import 'package:places/widgets/places_alert_dialogue.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.currentPlace,
    required this.onDelete,
  });

  final Place currentPlace;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentPlace.placeTitle,
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              showPlacesDialogue(
                context,
                titleText: 'Delete Place',
                contentText: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: isDark
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Are you sure to delete this place :\n'),
                      TextSpan(
                        text: currentPlace.placeTitle,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: isDark
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ), // Apply fontWeight to title
                      ),
                      const TextSpan(text: '?'),
                    ],
                  ),
                ),
                action1: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                action2: ElevatedButton(
                  onPressed: () {
                    onDelete();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
