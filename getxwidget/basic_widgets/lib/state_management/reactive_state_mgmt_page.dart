import 'package:basic_widget/state_management/controller/reactive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveStateMgmtPage extends GetView<ReactiveController> {
  ReactiveStateMgmtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reactive State Mgmt.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Count value is ${controller.count.value}')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // controller.increment();
                  controller.count.update((cnt) {
                    controller.count.value=cnt!+10;
                  });
                },
                child: Text('Increment')),
            ElevatedButton(
                onPressed: () {
                  // controller.changeStudent(newName: 'Jackie', newAge: 53);

                  controller.student.update((studen) {
                    studen!.name = studen.name.toString().toUpperCase();
                  });
                },
                child: Text('Student')),
            SizedBox(
              height: 10,
            ),
            Obx(() => Text(
                'Name is ${controller.student.value.name} & Age is ${controller.student.value.age}')),
          ],
        ),
      ),
    );
  }
}
