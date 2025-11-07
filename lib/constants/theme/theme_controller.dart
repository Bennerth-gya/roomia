import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Observable theme mode (default: system)
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  // Toggle between light and dark mode manually (optional)
  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  // Apply system theme (device setting)
  void setSystemTheme() {
    themeMode.value = ThemeMode.system;
  }
}
