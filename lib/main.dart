import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/feature/auth/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import 'feature/auth/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: LoginScreen(),
    );
  }
}
