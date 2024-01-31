import 'package:fetch_api_data/controller/email_storage_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailStoragePage extends GetView<EmailStorageController> {
  const EmailStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Validataion and Storage'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller.emailController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(controller.emailController.text)) {
                  controller.write();
                } else {
                  Get.snackbar(
                      'Incorrect Email', 'Provide Email in valid format',
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Write')),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                controller.read();
              },
              child: Text('Read')),
          SizedBox(
            height: 10,
          ),
          Obx(() => Text('The email is ${controller.readValue}')),
        ],
      ),
    );
  }
}
