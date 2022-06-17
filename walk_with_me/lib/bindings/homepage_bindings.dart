import 'package:get/get.dart';
import 'package:walk_with_me/controllers/bottom_nav_bar_controller.dart';
import 'package:walk_with_me/controllers/location_controller.dart';

class HomepageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
    Get.lazyPut(() => LocationController());
  }
}
