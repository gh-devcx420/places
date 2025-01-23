import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/constants.dart';
import 'package:places/models/places_model.dart';
import 'package:places/widgets/places_image_input.dart';
import 'package:places/widgets/places_textfield.dart';

import '../providers/places_provider.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  TextEditingController placesController = TextEditingController();
  FocusNode placesFocusNode = FocusNode();
  File? receivedImage;

  bool validateInputs() {
    if (placesController.text.isEmpty &&
        placesController.text.trim().length <= 1 &&
        receivedImage == null) {
      return false;
    }
    return true;
  }

  void pickPlaceImage(File pickedImage) {
    receivedImage = pickedImage;
  }

  void addNewPlace() {
    if (validateInputs()) {
      var placesListHandler = ref.read(userPlacesProvider.notifier);
      placesListHandler.addNewPlace(
        Place(
          placeTitle: placesController.text,
          placeImage: receivedImage!,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Place'),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kScaffoldBodyPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PlacesTextfield(
              textFieldController: placesController,
              textFieldFocusNode: placesFocusNode,
              activeFieldIcon: const Icon(
                Icons.text_snippet,
              ),
              inactiveFieldIcon: const Icon(
                Icons.text_snippet_outlined,
              ),
            ),
            vGap20,
            ImageInput(
              onPickedImage: pickPlaceImage,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewPlace,
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
