import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var currentTabBarIndex = 0.obs;

  void changeTabIndex(int index) {
    currentTabBarIndex.value = index;
  }
}
