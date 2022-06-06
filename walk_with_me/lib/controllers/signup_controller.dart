import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/globals/constants.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  bool validate() {
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar('error_text'.tr, 'invalid_email_error'.tr);
      return false;
    }
    if (GetUtils.isLengthLessThan(
        passwordController.text, Constants.maxPasswordLength)) {
      Get.snackbar('error_text'.tr, 'max_password_length_error'.tr);
      return false;
    }
    if (passwordController.text.compareTo(confirmPasswordController.text) !=
        0) {
      Get.snackbar('error_text'.tr, 'passwords_do_not_match'.tr);
      return false;
    }
    return true;
  }
}
