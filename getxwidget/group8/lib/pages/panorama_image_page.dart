import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/panorama_image_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panorama/panorama.dart';

class PanoramaImagePage extends GetView<PanoramaImageController> {
  const PanoramaImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panorama Image'),
      ),
      body: Obx(
        () => Panorama(
          zoom: 1,
          animSpeed: 1.0,
          child: controller.selectImagePath.value != ''
              ? Image.file(File(controller.selectImagePath.value))
              : Image.asset('images/login.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getImage(ImageSource.camera);
        },
        child: Icon(Icons.photo),
      ),
    );
  }
}
