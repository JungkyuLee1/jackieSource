import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      backgroundColor: backgroundColor, snackPosition: SnackPosition.BOTTOM);
}