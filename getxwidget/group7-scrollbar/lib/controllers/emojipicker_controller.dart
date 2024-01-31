import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmojiPickerController extends GetxController {
  var isEmojiVisible = false.obs;
  late TextEditingController emojiController;
  FocusNode focusNode = FocusNode();


  @override
  void onInit() {
    super.onInit();
    emojiController = TextEditingController();

    emojiListener();
  }

  emojiListener() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isEmojiVisible.value = false;
      }
    });

    @override
    void onClose() {
      super.onClose();
      emojiController.dispose();
    }
  }
}