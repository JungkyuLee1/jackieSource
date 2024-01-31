import 'package:basic_widget/state_management/controller/simple_controller.dart';
import 'package:basic_widget/state_management/controller/worker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkersPage extends GetView<WorkerController> {
  WorkersPage({Key? key}) : super(key: key);

  // SimpleController simpleController = Get.put(SimpleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workers'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Get.find<SimpleController>().increment();

                  controller.increment();
                },
                child: Text('Increment')),
            SizedBox(height: 10,),
            TextField(
              onChanged: (val){
                controller.increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
