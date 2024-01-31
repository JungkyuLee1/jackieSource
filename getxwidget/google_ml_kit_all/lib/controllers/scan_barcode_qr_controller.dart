import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../common/common_wigets.dart';
import 'package:flutter/material.dart';

class ScanBarcodeQrController extends GetxController {
  var barcodeScanResult = ''.obs;

  Future<void> scanBarcodeNormal() async {
    String? scanData;
    try {
      scanData = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      if (scanData.isNotEmpty) {
        barcodeScanResult.value = '';
        barcodeScanResult(scanData);
      } else {
        Common.showSnackBar('Fail', 'Scan failed !', Colors.red);
      }
    } on PlatformException catch (e) {
      Common.showSnackBar('Error', e.toString(), Colors.red);
    }
  }

  //QR code
  Future<void> scanQRCodeNormal() async {
    String? scanData;

    try {
      scanData = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (scanData!.isNotEmpty) {
        barcodeScanResult.value = '';
        barcodeScanResult(scanData);
      } else {
        Common.showSnackBar('Fail', 'Scan failed !', Colors.red);
      }
    } on PlatformException catch (e) {
      Common.showSnackBar('Error', e.toString(), Colors.red);
    }
  }

  Future<void> streamedBarcodeScan() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) {
      barcodeScanResult.value = '';
      //임시 조치
      if (barcode != '-1' && barcode.isNotEmpty) {
        barcodeScanResult(barcode);
      }
      // print('StreamedData : ${barcodeScanResult.value}');
    });
  }

  //copy to Clipboard
  void copyTextToClipboard() async {
    if (barcodeScanResult.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: barcodeScanResult.value));
      Common.showSnackBar('Notice', 'Text copied successfully', Colors.green);
    } else {
      Common.showSnackBar(
          'Warning', 'Image has no text that can be extracted', Colors.red);
    }
  }

}
