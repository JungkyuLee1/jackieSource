import 'dart:io';

import 'package:feature_collection/controllers/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends GetView<ImagePickerController> {
   ImagePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => controller.selectedImagePath.value == ''
                ? Text(
                    'Select image from camera/gallery',
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(child: Image.file(File(controller.selectedImagePath.value)))),
            Obx(
              () => Text(
                "File Size : ${controller.selectedImageSize.value == '' ? '' : controller.selectedImageSize.value}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text('Gallery')),
            ElevatedButton(
                onPressed: () {

                  controller.getImage(ImageSource.camera);
                },
                child: Text('Camera')),
          ],
        ),
      ),
    );
  }
}
