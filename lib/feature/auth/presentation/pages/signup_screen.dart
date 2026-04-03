import 'package:blog_app/feature/auth/presentation/widgets/auth_fields.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> 
{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text("SignIn", style: TextStyle(fontSize: 36),),


            const SizedBox(height: 8,),

            AuthField(inputController: _usernameController, hintText: "username"),

            AuthField(inputController: _passwordController, hintText: "Password",obscureText: true,),

            AuthField(inputController: _emailController, hintText: "email"),

            ElevatedButton(onPressed: () {}, child: Text("SignIn")),

            Text.rich(TextSpan(text: "Create new account")),
          ],
        ),
      ),
    );
  }
}