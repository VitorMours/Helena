import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String hintText;

  IconButton suffixIcon;

  bool obscureText = true;
  TextEditingController controller;
  PasswordInput(
    this.hintText,
    this.obscureText,
    this.suffixIcon, {
    super.key,
    required this.controller,
  });

  @override
  State createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
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
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
