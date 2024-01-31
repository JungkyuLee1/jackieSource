import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_controller.dart';

class SmsCodeController extends GetxController {
  CountdownController countdownController = CountdownController();
  TextEditingController textEditingController = TextEditingController();
  var messageOptCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    smsAutoFillListener();
  }

  void smsAutoFillListener() async {
    await SmsAutoFill().listenForCode();

    SmsAutoFill().getAppSignature.then((value) {
    print('Signature : ${SmsAutoFill().getAppSignature}');
    });
  }

  @override
  void onReady() {
    super.onReady();
    countdownController.start();
  }

  @override
  void onClose() {
    super.onClose();
    // textEditingController.dispose();
    SmsAutoFill().unregisterListener();
  }
}
