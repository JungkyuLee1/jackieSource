import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group4/controllers/method_channel_controller.dart';

class MethodChannelPage extends GetView<MethodChannelController> {
  const MethodChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Method Channel'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.openCamera();
          },
          child: Text('Open Camera'),
        ),
      ),
    );
  }
}
