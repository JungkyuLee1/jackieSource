import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/multi_image_controller.dart';

class MultiImagePage extends GetView<MultiImageController> {
  const MultiImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Image Selection'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                controller.getImages();
              },
              child: Text('Pick Files')),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: controller.selectedFileList.value.length,
                  itemBuilder: (context, index) {
                    final image = controller.selectedFileList.value[index].path;

                    return Container(
                      // width: 100,
                      // height: 100,
                      child: Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
