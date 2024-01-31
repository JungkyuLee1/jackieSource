import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../common/common_wigets.dart';

class TextExtractController extends GetxController {
  var selectedImagePath = ''.obs;
  var finalText = ''.obs;
  var finalBarcode = ''.obs;
  var isLoading = false.obs;

  // XFile? pickedFile;
  final textRecognizer = GoogleMlKit.vision.textRecognizer();

  //Image pick
  void getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) {
      isLoading(false);
      return;
    }

    selectedImagePath.value = pickedFile!.path;

    if (selectedImagePath.value.isNotEmpty) {
      isLoading(true);
      finalText.value = '';
    } else {
      isLoading(false);
    }
  }

  //Text 추출
  void getTextFromImage() async {
    if (selectedImagePath.value.isNotEmpty) {
      final inputImage = InputImage.fromFile(File(selectedImagePath.value));
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      // String text = recognizedText.text;

      for (TextBlock block in recognizedText.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            finalText.value = finalText.value + ' ' + element.text;
          }
        }
      }
    } else {
      Common.showSnackBar('Notice', 'Please select a image', Colors.red);
    }
  }

  void copyTextToClipboard() async {
    if (finalText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: finalText.value));
      Common.showSnackBar('Notice', 'Text copied successfully', Colors.green);
    } else {
      Common.showSnackBar(
          'Warning', 'Image has no text that can be extracted', Colors.red);
    }
  }
}
