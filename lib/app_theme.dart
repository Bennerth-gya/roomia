import 'package:flutter/material.dart';

class AppTheme {
  // 🌞 Light theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blueAccent,
      textTheme: Theme.of(
        context,
      ).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.black),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueAccent,
        brightness: Brightness.light,
      ),
    );
  }

  // 🌚 Dark theme
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.blueAccent,
      textTheme: Theme.of(
        context,
      ).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueAccent,
        brightness: Brightness.dark,
      ),
    );
  }
}
