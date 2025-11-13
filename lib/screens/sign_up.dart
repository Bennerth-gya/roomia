import 'package:flutter/material.dart';
import 'package:roomia/constants/signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth >= 1024;
          bool isTablet =
              constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
          bool isMobile = constraints.maxWidth < 600;

          double formWidth = isDesktop
              ? 400
              : isTablet
              ? 350
              : double.infinity;

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 32,
                vertical: 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: formWidth),
                child: Card(
                  elevation: isDesktop ? 8 : 0,
                  color: isDark
                      ? Colors.grey.shade900
                      : Colors.white, // adjusts card color
                  shadowColor: theme.shadowColor.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: const _SignUpFormLayout(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SignUpFormLayout extends StatelessWidget {
  const _SignUpFormLayout();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Text(
          'Create your account',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),

        // Form widget
        const SignupForm(),
      ],
    );
  }
}
