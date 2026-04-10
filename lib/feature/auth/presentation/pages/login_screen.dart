import 'package:blog_app/feature/auth/presentation/pages/signup_screen.dart';
import 'package:blog_app/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_gradient_button.dart';
import '../../../../core/theme/app_pallete.dart';

class LoginScreen extends StatefulWidget {
   static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());

 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


@override
void dispose(){

  _usernameController.dispose();
  _passwordController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              Text("SignIn", style: TextStyle(fontSize: 36)),

              const SizedBox(height: 8),

              AuthField(
                inputController: _usernameController,
                hintText: "username",
              ),


              AuthField(
                inputController: _passwordController,
                hintText: "Password",
                isObscureText: true,
              ),


              const SizedBox(height: 2),

              AuthGradientButton(text: "SignIn",),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, SignupScreen.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: " Sign Up",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
    ); }
}
