import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.inputController,
    required this.hintText,
    this.isObscureText = false,
  });

  final TextEditingController inputController;
  final String hintText;
  final bool isObscureText;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(hintText: hintText),
      validator: (value)  {
        if( value!.isEmpty ){
          return "$hintText is missing.";
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
