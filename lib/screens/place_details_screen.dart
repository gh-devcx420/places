import 'package:flutter/material.dart';
import 'package:places/constants.dart';
import 'package:places/models/places_model.dart';
import 'package:places/screens/map_screen.dart';
import 'package:places/widgets/places_alert_dialogue.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.currentPlace,
    required this.onDelete,
  });

  final Place currentPlace;
  final VoidCallback onDelete;

  String get locationPreviewURL {
    final lat = currentPlace.placeLocation.latitude;
    final lng = currentPlace.placeLocation.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lng&key=AIzaSyCYfHmKomCigkW-1MCxKyuEMPgQPUbwN6M';
  }

  void _openMap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapScreen(
          location: currentPlace.placeLocation,
          isSelecting: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Place Details',
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
      body: Padding(
        padding: const EdgeInsets.all(kScaffoldBodyPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      child: Image.file(
                        currentPlace.placeImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(kBorderRadius),
                        topLeft: Radius.circular(kBorderRadius),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.4),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text(
                            currentPlace.placeTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              vGap10,
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _openMap(context);
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: kBorderThickness,
                          ),
                          borderRadius: BorderRadius.circular(kBorderRadius),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kBorderRadius - 2),
                          child: Image.network(
                            locationPreviewURL,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    hGap10,
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Address:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            TextSpan(
                              text: currentPlace.placeLocation.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
