// lib/widgets/onboarding_dots.dart
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentIndex;
  final int totalDots;

  const OnboardingDots({
    super.key,
    required this.currentIndex,
    required this.totalDots,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: isActive ? 24 : 10,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
