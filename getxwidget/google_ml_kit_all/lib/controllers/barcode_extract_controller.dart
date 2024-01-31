import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../common/common_wigets.dart';

class BarcodeExtractController extends GetxController {
  var selectedImagePath = ''.obs;
  var finalBarcodeText = ''.obs;
  var barcodeWifi = ''.obs;
  var isLoading = false.obs;

  // XFile? pickedFile;
  final BarcodeScanner _barcodeScanner = BarcodeScanner();

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
      finalBarcodeText.value = '';
    } else {
      isLoading(false);
    }
  }

  void getBarcodeFromImage() async {
    if (selectedImagePath.value.isNotEmpty) {
      final inputImage = InputImage.fromFile(File(selectedImagePath.value));

      List<Barcode> barcodes = await _barcodeScanner.processImage(inputImage);

      finalBarcodeText.value = '';
      String text = 'Barcode found : ${barcodes.length}\n\n';

      for (Barcode barcode in barcodes) {
        // final BarcodeType type = barcode.type;
        // final Rect boundingBox = barcode.boundingBox;
        // // final String? displayValue = barcode.displayValue;
        // final String? rawValue = barcode.rawValue;

        // switch (type) {
        //   case BarcodeType.wifi:
        //     final barcodeWifi = barcode.value as BarcodeWifi;
        //     break;
        //   case BarcodeType.url:
        //     final barcodeUrl = barcode.value as BarcodeUrl;
        //     break;
        //   default:
        //     break;
        // }
        text += 'Barcode : ${barcode.rawValue}\n\n';
      }
      finalBarcodeText.value = text;
    } else {
      Common.showSnackBar('Notice', 'Please select a image', Colors.red);
    }
  }

  void copyTextToClipboard() async {
    if (finalBarcodeText.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: finalBarcodeText.value));
      Common.showSnackBar(
          'Notice', 'Barcode copied successfully', Colors.green);
    } else {
      Common.showSnackBar(
          'Warning', 'Image has no barcode that can be extracted', Colors.red);
    }
  }
}
