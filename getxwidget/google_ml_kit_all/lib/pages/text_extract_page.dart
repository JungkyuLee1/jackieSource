import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/text_extract_controller.dart';
import 'package:image_picker/image_picker.dart';

class TextExtractPage extends GetView<TextExtractController> {
  const TextExtractPage({Key? key}) : super(key: key);

  Widget _dataArea() {
    return Obx(
      () => controller.isLoading.value == true
          ? Column(
              children: [
                Container(
                  height: Get.height * 0.5,
                  width: Get.width - 30,
                  child: Image.file(
                    File(controller.selectedImagePath.value),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  controller.finalText.value,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  maxLines: 8,
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.getTextFromImage();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.teal),
                    child: Text(
                      'Extract Text!!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            )
          : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Extract from Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text.rich(
                TextSpan(
                    text: 'Extract Text',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.teal),
                    children: [
                      TextSpan(
                        text: ' Google Ml Kit !!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.amber),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.getImage(ImageSource.gallery);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 10),
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal),
                    )),
                ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                    child: Text(
                      'Camera',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                )
              ],
            ),
            _dataArea(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.copyTextToClipboard();
        },
        child: Icon(
          Icons.copy,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
