import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roomia/constants/image_strings.dart';
import 'package:roomia/constants/roomia_text.dart';
import 'package:roomia/controllers/onboarding_dots.dart';
import 'package:roomia/screens/login_page.dart'; // ✅ Import Login screen

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ PageView for onboarding screens
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              _buildOnboardingItem(
                image: RoomiaImages.onboardingSearching,
                title: RoomiaText.roomiaTextTitle1,
                subtitle: RoomiaText.roomiaTextSubTitle1,
              ),
              _buildOnboardingItem(
                image: RoomiaImages.onboardingPayment,
                title: RoomiaText.roomiaTextTitle2,
                subtitle: RoomiaText.roomiaTextSubTitle2,
              ),
            ],
          ),

          // ✅ Dots and Get Started button at bottom
          Positioned(
            bottom: 50,
            child: Column(
              children: [
                OnboardingDots(
                  currentIndex: _currentPage,
                  totalDots: 2,
                  pageController: _pageController, // ✅ Pass controller here
                ),

                const SizedBox(height: 20),

                // ✅ Only show button on last page
                if (_currentPage == 1)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to LoginPage
                      Get.offAll(() => const LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 23,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Helper method for each onboarding page
  Widget _buildOnboardingItem({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300, fit: BoxFit.contain),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
