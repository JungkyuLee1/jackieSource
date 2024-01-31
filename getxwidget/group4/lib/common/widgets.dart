import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Widgets {

  static void showSnackBar(String title, String message, Color colorText,
      Color backgroundColor) {
    Get.snackbar(title, message,
        colorText: colorText,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM);
  }
}
