import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roomia/screens/favourites_page.dart';

// Import your screens here
import 'package:roomia/screens/home_page.dart';
import 'package:roomia/screens/search_page.dart';

import 'package:roomia/screens/profile_page.dart';

// Optional: if you have a custom color file

class HostelNavigationMenu extends StatelessWidget {
  const HostelNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HostelNavigationController());

    // Optional dark mode detection (you can remove if not needed)
    final bool darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,

      // ===== Bottom Navigation Bar =====
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.search, color: Color.fromARGB(255, 4, 55, 103)),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 227, 31, 17),
              ),
              label: 'Favorites',
            ),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),

      // ===== Body (Screen Switching) =====
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class HostelNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(), // 🏠 Main hostel listing
    const SearchPage(), // 🔍 Search for hostels
    const FavouritesPage(), // ❤️ Saved hostels
    const ProfilePage(), // 👤 User account / settings
  ];
}
