import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';

class SpeechTextController extends GetxController {
  var speechText = 'Press the Mic button and start speaking'.obs;
  List<String> texts = <String>[].obs;

  var isListening = false.obs;
  var isFirst = true.obs;
  late SpeechToText speechToText;

  @override
  void onInit() {
    super.onInit();
    speechToText = SpeechToText();
  }

  void listen() async {
    bool available = await speechToText.initialize(
      onStatus: (val) {},
      onError: (val) {},
    );

    if (available) {
      isListening.value = true;

      speechToText.listen(
          listenFor: Duration(seconds: 30),
          listenMode: ListenMode.confirmation,
          onResult: (val) {
            if (val.finalResult) {
              if (isFirst.value) {
                speechText.value = '';
                speechText.value += '' + val.recognizedWords+'.';
                isFirst(false);
              } else {
                speechText.value += '' + val.recognizedWords+'.';
              }
            }
          });
    } else {
      isListening.value = false;
      speechToText.stop();
      speechText.value = '';
    }
  }

  void copyTextToClipboard() async {
    if (speechText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: speechText.value));
      showSnackBar(
          'Notice', 'Barcode copied successfully', Colors.green);
    } else {
      showSnackBar(
          'Warning', 'Image has no barcode that can be extracted', Colors.red);
    }
  }

  void showSnackBar(String title, String message, Color backgroundColor){
    Get.snackbar(title, message, backgroundColor: backgroundColor, snackPosition: SnackPosition.BOTTOM);
  }


  void reset() {
    speechText.value = '';
    isListening.value = false;
    speechToText.stop();
  }
}
