import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:roomia/screens/favourites_page.dart';
import 'package:roomia/screens/home_page.dart';
import 'package:roomia/screens/post_page.dart';
import 'package:roomia/screens/profile_page.dart';
import 'package:roomia/screens/search_page.dart';

class HostelNavigationMenu extends StatelessWidget {
  const HostelNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HostelNavigationController());
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
          onDestinationSelected: (index) {
            //  Navigate to CreatePostPage if the "Post" icon is tapped
            if (index == 2) {
              Get.to(() => const CreatePostPage());
            } else {
              controller.selectedIndex.value = index;
            }
          },
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
              icon: Icon(Iconsax.search_normal),
              label: 'Search',
            ),
            NavigationDestination(icon: Icon(Iconsax.add), label: 'Post'),
            NavigationDestination(icon: Icon(Iconsax.car), label: 'Ride'),
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
    const HomePage(),
    const SearchPage(),
    const SizedBox(), // Empty placeholder since Post navigates separately
    const RidePage(),
    const ProfilePage(),
  ];
}
