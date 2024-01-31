import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CopyPasteController extends GetxController {
  late TextEditingController textController;
  var text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    textController.dispose();
  }

  //copy
  void copyText(String value) {
    Clipboard.setData(ClipboardData(text: value));
  }

  //paste
  void pasteText() async {
    ClipboardData? clipboard = await Clipboard.getData('text/plain');
    text.value = clipboard!.text!;
  }
}
