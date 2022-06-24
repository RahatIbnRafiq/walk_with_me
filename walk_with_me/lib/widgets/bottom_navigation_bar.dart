import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  BottomNavigationBarItem navBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20.0,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavBarController =
        Get.find<BottomNavigationBarController>();
    return Obx(
      () => BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: bottomNavBarController.changeTabIndex,
        currentIndex: bottomNavBarController.currentTabBarIndex.value,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        elevation: 0.0,
        items: [
          navBarItem(Icons.travel_explore_rounded, 'explore'.tr),
          navBarItem(Icons.navigation, 'map_view'.tr),
          navBarItem(Icons.music_note, 'Listen'.tr),
        ],
      ),
    );
  }
}
