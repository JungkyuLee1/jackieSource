
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ImagePaintController extends GetxController{
  var isLoading = false.obs;
  ui.Image? image;

  @override
  void onInit() async{
    super.onInit();
    loadImage('assets/error.jpeg');
  }

  void loadImage(String path) async{
    final data=await rootBundle.load(path);
    final bytes=data.buffer.asUint8List();
    final imageResult=await decodeImageFromList(bytes);

    image=imageResult;
    isLoading(true);
  }
}