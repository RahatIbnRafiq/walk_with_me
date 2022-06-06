import 'package:get/get.dart';
import 'package:walk_with_me/controllers/signin_controller.dart';

class SigninBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}
