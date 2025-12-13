import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final String hintText;

  const FormInput(this.hintText, {super.key});

  @override
  State createState() => FormInputState();
}

class FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.secondary, width: 2),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.outline, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: theme.hintColor,
        ),
      ),
    );
  }
}
