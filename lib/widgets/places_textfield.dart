import 'package:flutter/material.dart';

class PlacesTextfield extends StatefulWidget {
  const PlacesTextfield({
    super.key,
    required this.textFieldController,
    required this.textFieldFocusNode,
    required this.activeFieldIcon,
    required this.inactiveFieldIcon,
  });

  final TextEditingController textFieldController;
  final FocusNode textFieldFocusNode;
  final Icon activeFieldIcon;
  final Icon inactiveFieldIcon;

  @override
  State<PlacesTextfield> createState() => _PlacesTextfieldState();
}

class _PlacesTextfieldState extends State<PlacesTextfield> {
  late bool isFocused;
  String fieldData = '';

  void _handleFocusChange() {
    setState(() {
      isFocused = widget.textFieldFocusNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    isFocused = widget.textFieldFocusNode.hasFocus;
    widget.textFieldFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.textFieldFocusNode.removeListener(_handleFocusChange);
    widget.textFieldController.dispose();
    widget.textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      controller: widget.textFieldController,
      focusNode: widget.textFieldFocusNode,
      onTap: () {},
      onTapOutside: (event) {
        widget.textFieldFocusNode.unfocus();
      },
      onChanged: (value) {
        setState(() {
          fieldData = value;
        });
      },
      decoration: InputDecoration(
        prefixIcon: fieldData.isNotEmpty
            ? widget.activeFieldIcon
            : widget.inactiveFieldIcon,
        prefixIconColor: fieldData.isNotEmpty
            ? isDark
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline,
        suffixIcon: fieldData.isNotEmpty
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget.textFieldController.text = '';
                    fieldData = '';
                  });
                },
                child: Icon(
                  Icons.replay_sharp,
                  color: isDark
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        hintText: 'Place Title',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.w600,
            ),
      ),
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: isDark
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
      textCapitalization: TextCapitalization.words,
      cursorColor: isDark
          ? Theme.of(context).colorScheme.onPrimary
          : Theme.of(context).colorScheme.primary,
    );
  }
}
