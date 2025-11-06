import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roomia/constants/forgot_password.dart';
import 'package:roomia/constants/navigation_menu.dart';
import 'package:roomia/screens/sign_up.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            //<<<<<<------------Email------------>>>>>>
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'E-Mail',
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: 'Emali',
              ),
            ),

            const SizedBox(height: 16),

            //<<<-----------Password----------------->>>
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Iconsax.password_check),
                labelText: 'Password',
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: 8),

            //<<--------Remember Me and Forgot Password----->>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [const Text('Remember Me')],
                ),

                //<<--------Forgot Password------>>
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text('Forgot Password'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            //<<<<--------------Sign In Button ----------->>>>
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(const HostelNavigationMenu()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Sign In'),
              ),
            ),
            const SizedBox(height: 12),

            //<<------------Create Account Button----------->>>
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUp()),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.black),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
