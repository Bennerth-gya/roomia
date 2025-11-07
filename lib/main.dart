import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomia/app_theme.dart';
import 'package:roomia/constants/theme/theme_controller.dart';
import 'package:roomia/screens/onboarding_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // ✅ Enables DevicePreview in debug mode only
      builder: (context) => const RoomiaApp(),
    ),
  );
}

class RoomiaApp extends StatelessWidget {
  const RoomiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Initialize the ThemeController (GetX)
    final themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Roomia',
        // ✅ Automatically switch between light and dark themes
        themeMode: themeController.themeMode.value,

        // ✅ Light and Dark themes from AppTheme
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.darkTheme(context),

        // ✅ First page of your app
        home: const OnboardingPage(),

        // ✅ Ensures media query data from DevicePreview is used
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
