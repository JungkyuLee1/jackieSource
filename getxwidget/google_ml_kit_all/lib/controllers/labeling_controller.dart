import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../common/common_wigets.dart';

class LabelingController extends GetxController {
  var selectedImagePath = ''.obs;
  var finalLabelText = ''.obs;
  var isLoading = false.obs;
  XFile? pickedFile;
  final ImageLabelerOptions _options =
      ImageLabelerOptions(confidenceThreshold: 0.5);
  ImageLabeler? imageLabeler;

  @override
  void onInit() {
    super.onInit();
    imageLabeler = ImageLabeler(options: _options);
  }

  //Image pick
  void getImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) {
      isLoading(false);
      return;
    }

    selectedImagePath.value = pickedFile!.path;

    if (selectedImagePath.value.isNotEmpty) {
      isLoading(true);
      finalLabelText.value = '';
    } else {
      isLoading(false);
    }
  }

  void getImageLabeling() async {
    if (selectedImagePath.value.isNotEmpty) {
      final inputImage = InputImage.fromFile(File(selectedImagePath.value));

      List<ImageLabel> labels = await imageLabeler!.processImage(inputImage);
      finalLabelText.value = '';

      String text = 'Label Info. : ${labels.length}\n\n';

      for (ImageLabel label in labels) {
        final String labelText = label.label;
        final int index = label.index;
        final double confidence = label.confidence;

        String subText =
            'label : ${labelText}\n index: ${index}\n confidence : ${confidence}\n';
        text += subText;
      }
      finalLabelText.value = text;
    } else {
      Common.showSnackBar('Notice', 'Please select a image', Colors.red);
    }
  }

  //Clipboard
  void copyTextToClipboard() async {
    if (finalLabelText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: finalLabelText.value));
      Common.showSnackBar(
          'Notice', 'Label info. copied successfully', Colors.green);
    } else {
      Common.showSnackBar('Warning',
          'Image has no Label Info. that can be extracted', Colors.red);
    }
  }
}
