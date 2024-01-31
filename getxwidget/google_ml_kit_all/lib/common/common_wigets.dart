import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Common{

  static showSnackBar(String title, String message, Color backGroundColor){
    Get.snackbar(title, message,
      backgroundColor: backGroundColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.red
    );
  }
}