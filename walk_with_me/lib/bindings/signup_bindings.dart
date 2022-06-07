import 'package:get/get.dart';
import 'package:walk_with_me/controllers/signup_controller.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
