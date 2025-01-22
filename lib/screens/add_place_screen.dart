import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/places_model.dart';
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

  bool validateInputs() {
    if (placesController.text.isEmpty &&
        placesController.text.trim().length <= 1) {
      return false;
    }
    return true;
  }

  void addNewPlace() {
    if (validateInputs()) {
      var placesListHandler = ref.read(userPlacesProvider.notifier);
      placesListHandler.addNewPlace(
        Place(
          placeTitle: placesController.text,
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
        padding: const EdgeInsets.all(8.0),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewPlace,
        child: Icon(
          Icons.save,
        ),
      ),
    );
  }
}
