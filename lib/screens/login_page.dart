import 'package:flutter/material.dart';
import 'package:roomia/constants/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 130),

                  // ✅ App title (optional)
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Login Form
                  const LoginForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
