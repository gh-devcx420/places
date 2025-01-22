import 'package:flutter/material.dart';
import 'package:places/constants.dart';
import 'package:places/widgets/places_textfield.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController placesController = TextEditingController();
  FocusNode placesFocusNode = FocusNode();

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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Save Place',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
