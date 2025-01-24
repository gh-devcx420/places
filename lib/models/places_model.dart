import 'dart:io';

import 'package:uuid/uuid.dart';

class PlaceLocation {
  double latitude;
  double longitude;
  String address;
  String areaName;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.areaName,
  });
}

class Place {
  String placeTitle;
  String placeID;
  File placeImage;
  PlaceLocation placeLocation;

  Place({
    required this.placeTitle,
    required this.placeImage,
    required this.placeLocation,
  }) : placeID = const Uuid().v4();
}
