import 'package:flutter/material.dart';

Future<dynamic> showPlacesDialogue(
  context, {
  required titleText,
  required Widget contentText,
  required Widget action1,
  required Widget action2,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: isDark
            ? Theme.of(context).colorScheme.surfaceDim
            : Theme.of(context).colorScheme.surface,
        title: Text(titleText),
        titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        content: contentText,
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        actions: [action1, action2],
        actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      );
    },
  );
}
