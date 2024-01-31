import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group5/controllers/scratcher_controller.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherPage extends GetView<ScratcherController> {
  const ScratcherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Scratcher(
              key: controller.scratcherKey,
              child: Container(
                width: 300,
                height: 300,
                child: Image(
                  image: AssetImage('assets/error.jpeg'),
                ),
              ),
              color: Colors.lightBlue,
              threshold: 50,
              brushSize: 20,
              onChange: (progress) {
                controller.scratchProgress.value = progress;
              },
              onThreshold: () {
                controller.isThresholdReached.value = true;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => Text('Scratch Progress : ' +
                controller.scratchProgress.value.toStringAsFixed(2))),
            SizedBox(
              height: 10,
            ),
            Obx(() => controller.isThresholdReached.value
                ? Text(
                    'Reached threshold',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  )
                : Text(
                    'Not reached threshold yet',
                    style: TextStyle(fontSize: 18),
                  )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.reset();
                },
                child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}
