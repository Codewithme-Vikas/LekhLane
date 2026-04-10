import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static InputBorder _border([Color borderColor = AppPallete.border]) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 3),
        borderRadius: BorderRadius.circular(8),
      );

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.background,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.borderFocus),
    ),
  );
}
