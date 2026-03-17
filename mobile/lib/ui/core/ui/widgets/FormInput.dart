import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final String hintText;
  final controller;
  final validator;
  const FormInput(this.hintText, {super.key, required this.controller, required this.validator});

  @override
  State createState() => FormInputState();
}

class FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
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
