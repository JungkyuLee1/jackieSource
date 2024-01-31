import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multifileupload_server/controllers/file_upload_controller.dart';

class FileUploadPage extends GetView<FileUploadController> {
  const FileUploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select files and upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.selectMultipleImage();
                    },
                    child: Text("Select")),
                SizedBox(
                  width: 10,
                ),
                Obx(
                  () => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.uploadImage();
                            },
                      child: controller.isLoading.value
                          ? Center(
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator()),
                            )
                          : Text('Upload')),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => GridView.builder(
                    itemCount: controller.selectedFileCount.value,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio: 1 / 1),
                    itemBuilder: (context, index) {
                      final image = controller.lstImagePath[index];

                      return Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
