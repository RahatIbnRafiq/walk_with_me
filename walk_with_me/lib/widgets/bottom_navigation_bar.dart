import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              size: 20.0,
            ),
            label: 'Map View',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              size: 20.0,
            ),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback_rounded,
              size: 20.0,
            ),
            label: 'Contact us',
          ),
        ],
      ),
    );
  }
}
