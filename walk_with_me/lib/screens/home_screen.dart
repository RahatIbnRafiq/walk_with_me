import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/bottom_nav_bar_controller.dart';
import 'package:walk_with_me/screens/contact_us_screen.dart';
import 'package:walk_with_me/screens/discover_screen.dart';
import 'package:walk_with_me/screens/mapview_screen.dart';
import 'package:walk_with_me/widgets/app_drawer.dart';
import 'package:walk_with_me/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController bottomNavBarController =
        Get.find<BottomNavigationBarController>();
    return Scaffold(
      appBar: AppBar(title: Text('apptitle'.tr)),
      drawer: const AppDrawer(),
      body: Obx(
        () => IndexedStack(
          index: bottomNavBarController.currentTabBarIndex.value,
          children: const [
            DiscoverScreen(),
            MapViewScreen(),
            ContactUsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
