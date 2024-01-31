import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HideFloatingActionBtnController extends GetxController {
  var showFab = false.obs;
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // focusListen();
  }

  // void focusListen() {
  //   focusNode.addListener(() {
  //     if (!focusNode.hasFocus) {
  //       FocusManager.instance.primaryFocus?.unfocus();
  //       print('not focused');
  //     } else {
  //       print('focused');
  //     }
  //   });
  // }
}
