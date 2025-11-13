import 'package:flutter/material.dart';
import 'package:roomia/screens/home_page.dart';
// ✅ make sure path is correct

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true, // ✅ required for DevicePreview
      debugShowCheckedModeBanner: false,
      title: 'Hostel App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // ✅ Start from the hostel feed
    );
  }
}
