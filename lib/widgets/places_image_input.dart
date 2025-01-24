import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:places/constants.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickedImage});

  final void Function(File currentImage) onPickedImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onPickedImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget containerContent = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take a Photo'),
      icon: const Icon(Icons.camera),
    );

    if (_selectedImage != null) {
      containerContent = ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadius - 2),
        child: InkWell(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      );
    }
    return Container(
      height: 250,
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
      child: containerContent,
    );
  }
}
