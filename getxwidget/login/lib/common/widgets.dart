import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Widgets{

  static showSnackBar(String title, String message, Color colorText, Color backgroundColor){
    Get.snackbar(title, message, backgroundColor: backgroundColor, snackPosition: SnackPosition.BOTTOM);
  }

}