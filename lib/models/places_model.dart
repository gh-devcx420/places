import 'dart:io';

import 'package:uuid/uuid.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  final String areaName;

  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.areaName,
  });
}

class Place {
  final String placeTitle;
  final String placeID;
  final File placeImage;
  final PlaceLocation placeLocation;

  Place({
    required this.placeTitle,
    required this.placeImage,
    required this.placeLocation,
  }) : placeID = const Uuid().v4();
}
