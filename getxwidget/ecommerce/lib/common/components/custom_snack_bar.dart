import 'package:ecommerce/common/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  //Error SnackBar
  static void showErrorSnackBar(
      {required String title, required String message}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.failureRed,
        titleText: Text(title,
            style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.whiteColor)),
        messageText: Text(
          message,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.whiteColor),
        ),
        colorText: AppColor.whiteColor,
        borderRadius: 8,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        icon: Icon(
          Icons.error_outline,
          size: 40,
          color: AppColor.whiteColor,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 4));
  }

  //Info SnackBar
  static void showInfoSnackBar(
      {required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.helpBlue,
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(fontSize: 16,
          fontWeight: FontWeight.bold, color: AppColor.whiteColor
        ),
      ),
      messageText: Text(
        message,
        style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
          fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.whiteColor
        ),
      ),
      colorText: AppColor.whiteColor,
      borderRadius: 8,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      icon: Icon(
        Icons.info_outline,
        size: 40,
        color: AppColor.whiteColor,
      ),
      shouldIconPulse: true,
      duration: Duration(seconds: 4),
    );
  }

  //Success SnackBar
  static void showSuccessSnackBar(
      {required String title, required String message}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        titleText: Text(
          title,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor),
        ),
        messageText: Text(
          message,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.whiteColor),
        ),
        colorText: AppColor.whiteColor,
        borderRadius: 8,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        icon: Icon(
          Icons.check_circle_outline,
          size: 40,
          color: AppColor.whiteColor,
        ),
        shouldIconPulse: true,
        duration: Duration(seconds: 4));
  }
}
