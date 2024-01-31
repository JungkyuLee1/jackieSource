import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MethodChannelController extends GetxController {
  static const methodChannel = const MethodChannel('camera_channel');

  Future<Null> openCamera() async {
    try {
      await methodChannel.invokeMethod('openCamera');
    } catch (e) {}
  }
}
