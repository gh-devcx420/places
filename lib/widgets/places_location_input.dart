import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:places/constants.dart';
import 'package:places/models/places_model.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onPickLocation});

  final void Function(PlaceLocation) onPickLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  bool _isGettingLocation = false;

  String get locationPreview {
    if (_pickedLocation == null) {
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lng&key=AIzaSyCYfHmKomCigkW-1MCxKyuEMPgQPUbwN6M';
  }

  void _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&location_type=ROOFTOP&result_type=street_address&key=AIzaSyCYfHmKomCigkW-1MCxKyuEMPgQPUbwN6M');

    if (lat == null || lng == null) {
      setState(() {
        _isGettingLocation = false;
      });
      return;
    }

    final response = await http.get(url);
    final resData = jsonDecode(response.body);
    final address = resData['results'][0]['formatted_address'];
    final area = resData['results'][0]['address_components'][3]['long_name'];

    _pickedLocation = PlaceLocation(
      latitude: lat,
      longitude: lng,
      address: address,
      areaName: area,
    );
    if (_pickedLocation != null) {
      widget.onPickLocation(_pickedLocation!);
    }

    setState(() {
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    Widget widgetContent = Text(
      'No Location Chosen',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isDark
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
          ),
    );

    if (_pickedLocation != null) {
      widgetContent = ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadius - 2),
        child: Image.network(
          locationPreview,
          fit: BoxFit.fitWidth,
          height: double.infinity,
          width: double.infinity,
        ),
      );
    }

    if (_isGettingLocation == true) {
      widgetContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: kBorderThickness,
            ),
            color: Theme.of(context).colorScheme.surfaceDim,
          ),
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          child: widgetContent,
        ),
        vGap20,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.my_location),
              label: const Text('Current Location'),
            ),
            hGap10,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Pick on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
