import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../authorities/auth_handler.dart';
import '../common/widgets.dart';
import 'package:flutter/material.dart';

class QrCodeController extends GetxController {
  TextEditingController qrContentEditingController = TextEditingController();
  var qrCode = ''.obs;
  var scannedQrCode = ''.obs;

  @override
  void onClose() {
    super.onClose();
    qrContentEditingController.dispose();
  }

  //Scan QR code
  Future<void> scanQR() async {
    try {
      final cameraPermissionStatus=await Permission.camera.request();

      if(cameraPermissionStatus.isGranted) {
        scannedQrCode.value = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancel', true, ScanMode.QR);

        if (scannedQrCode != '-1') {
          Widgets.showSnackBar('Result', 'QR Code : ' + scannedQrCode.value,
              Colors.white, Colors.green);
        }
      }else if(cameraPermissionStatus.isDenied){
        print('denied');
      }
    } on PlatformException catch (e) {
      Widgets.showSnackBar(
          'Error', 'Something went wrong', Colors.white, Colors.red);
    }
  }

  // Future<void> checkCameraPermission() async{
  //   final cameraPermissionStatus=await Permission.camera.request();
  //
  //   if(cameraPermissionStatus == 'granted'){
  // }

  // Future<void> checkCameraPermission() async{
  //   if(Platform.isAndroid) {
  //     final androidInfo = await DeviceInfoPlugin().androidInfo;
  //
  //     if(androidInfo.version.sdkInt <=32){
  //       AuthHandler.checkPermission(Permission.storage);
  //     }else{
  //       AuthHandler.checkPermission(Permission.photos);
  //     }
  //   }
  // }
}
