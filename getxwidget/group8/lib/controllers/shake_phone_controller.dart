import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakePhoneController extends GetxController {
  var color = Colors.blue.obs;
  var count = 0.obs;
  late ShakeDetector shakeDetector;

  @override
  void onInit() {
    super.onInit();
    getRandomBackgroundColor();
  }

  void getRandomBackgroundColor() {
    shakeDetector = ShakeDetector.autoStart(
        onPhoneShake: () {
          color.value =
              Colors.primaries[Random().nextInt(Colors.primaries.length)];
          count.value += 1;
        },
        minimumShakeCount: 1,
        shakeThresholdGravity: 1.5);
  }

  @override
  void onClose() {
    super.onClose();
    shakeDetector.stopListening();
  }
}
