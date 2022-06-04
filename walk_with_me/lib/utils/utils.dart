import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static SnackbarController getErrorSnackbarBottom(title, message, error) {
    return Get.snackbar(
      title,
      message,
      messageText: Text(error),
    );
  }
}
