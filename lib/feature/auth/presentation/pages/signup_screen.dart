import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/feature/auth/presentation/pages/login_screen.dart';
import 'package:blog_app/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:blog_app/feature/auth/presentation/widgets/auth_gradient_button.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const SignupScreen());

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    // if form is submitting in valid manner
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;

    // CALL backend api <- call block appropriate event

    super.setState(fn);
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // submit form
      final String username = _usernameController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text("SignUp", style: TextStyle(fontSize: 36)),

              const SizedBox(height: 8),

              AuthField(
                inputController: _usernameController,
                hintText: "username",
              ),

              AuthField(inputController: _emailController, hintText: "email"),

              AuthField(
                inputController: _passwordController,
                hintText: "Password",
                isObscureText: true,
              ),

              const SizedBox(height: 2),

              AuthGradientButton(text: "Sign Up"),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginScreen.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don\'t have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: " Sign In",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
