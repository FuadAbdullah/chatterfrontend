import 'package:flutter/material.dart';

ThemeData chatterAppThemeData() {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.pink,
      onPrimary: Colors.white,
      secondary: Colors.pink,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red.shade900,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
