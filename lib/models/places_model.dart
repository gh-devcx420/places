import 'package:uuid/uuid.dart';

class Place {
  String placeTitle;
  String placeID;

  Place({required this.placeTitle}) : placeID = const Uuid().v4();
}
