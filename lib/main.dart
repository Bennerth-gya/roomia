import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // ✅ import GetX
import 'package:roomia/screens/onboarding_page.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const RoomiaApp(), // ✅ make const
  ),
);

class RoomiaApp extends StatelessWidget {
  const RoomiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // ✅ use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      useInheritedMediaQuery: true, // ✅ allows DevicePreview to work properly
      builder: DevicePreview.appBuilder,
      home: const OnboardingPage(),
    );
  }
}
