import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DraggableGameController extends GetxController {
  List<int> numbers = [1, 2, 3, 4, 5].obs;

  // var nums = <int>[1,2,3,4,5].obs;

  void restartGame() {
    numbers.addAll([1, 2, 3, 4, 5]);
  }

  void checkAcceptType(data, int acceptType) {
    if (data % 2 == 0) {
      if (acceptType == 1) {
        showSnackBar(
            title: "Status", message: 'Correct Answer', color: Colors.green);
      }
      if (acceptType == 0) {
        showSnackBar(
            title: 'Status', message: 'Incorrect Answer', color: Colors.red);
      }
      numbers.removeWhere((num) => num == data);
    } else if (data % 2 != 0) {
      if (acceptType == 0) {
        showSnackBar(
            title: "Status", message: 'Correct Answer', color: Colors.green);
      } else {
        showSnackBar(
            title: 'Status', message: 'Incorrect Answer', color: Colors.red);
      }
      numbers.removeWhere((num) => num==data);
    }
  }
}

void showSnackBar(
    {required String title, required String message, required Color color}) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color);
}
