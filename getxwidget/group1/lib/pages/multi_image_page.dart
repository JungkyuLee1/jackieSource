import 'dart:io';

import 'package:feature_collection/controllers/multi_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiImagePage extends GetView<MultiImageController> {
  const MultiImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Selection'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.getImages();
                },
                child: Text(
                  'Pick images from Gallery',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemCount: controller.imageFileList.isEmpty
                        ? 0
                        : controller.imageFileList.length,
                    itemBuilder: (context, index) {
                      final image = controller.imageFileList[index];

                      return Container(
                        child: Image.file(
                          File(image.path),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
