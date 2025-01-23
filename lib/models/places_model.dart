import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {
  String placeTitle;
  String placeID;
  File placeImage;

  Place({
    required this.placeTitle,
    required this.placeImage,
  }) : placeID = const Uuid().v4();
}
