import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.inputController,
    required this.hintText,
    this.obscureText = false,
  });

  final TextEditingController inputController;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(hintText: hintText),
      obscureText: obscureText,
    );
  }
}
