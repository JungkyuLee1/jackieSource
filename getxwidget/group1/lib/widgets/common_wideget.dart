import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Common {
  static showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        titleText: Text(
          title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }
}
