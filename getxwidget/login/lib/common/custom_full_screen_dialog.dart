import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFullScreenDialog {
  static showDialog() {
    Get.dialog(
        WillPopScope(
          onWillPop: () => Future.value(false),
          child: Container(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.yellow),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
        barrierColor: Color(0xff141A31).withOpacity(.3),
        useSafeArea: true);
  }

  static cancelDialog() {
    Get.back();
  }
}
