import 'package:blog_app/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Text("SignIn"),

            AuthField(inputController: _usernameController, hintText: "username"),

            AuthField(inputController: _passwordController, hintText: "Password"),

            ElevatedButton(onPressed: () {}, child: Text("SignIn")),

            Text.rich(TextSpan(text: "Create new account")),
          ],
        ),
      ),
    );
  }
}
