import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar('error_text'.tr, 'invalid_email_error'.tr);
      return false;
    }
    if (GetUtils.isLengthLessThan(passwordController.text, 1)) {
      Get.snackbar('error_text'.tr, 'password_cant_be_empty'.tr);
      return false;
    }
    return true;
  }

  void login() {}
}
