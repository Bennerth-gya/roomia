import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomia/constants/reset_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode =
        theme.brightness == Brightness.dark; // ✅ Check theme mode

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double formWidth = constraints.maxWidth >= 1024
              ? 400
              : constraints.maxWidth >= 600
              ? 350
              : double.infinity;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: formWidth),
                child: Card(
                  elevation: constraints.maxWidth >= 1024 ? 8 : 0,
                  color: isDarkMode
                      ? theme.colorScheme.surfaceVariant.withOpacity(0.2)
                      : theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forgot Password',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Enter your email to reset your password',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                Get.off(() => const HostelResetPassword()),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? theme.colorScheme.primaryContainer
                                  : theme.colorScheme.primary,
                              foregroundColor: isDarkMode
                                  ? theme.colorScheme.onPrimaryContainer
                                  : theme.colorScheme.onPrimary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
