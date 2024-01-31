import 'package:basic_widget/state_management/controller/simple_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleStateMgmtPage extends StatelessWidget {
   SimpleStateMgmtPage({Key? key}) : super(key: key);

  SimpleController simpleController = Get.put(SimpleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple State Mgmt.'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SimpleController>(
                // init: SimpleController(),
              // initState: (data)=>simpleController.increment(),
              //   dispose: (_)=>simpleController.cleanUpTask(),
                builder: (controller){
                  return Text('Count value is ${controller.count}');
                }),

            GetBuilder<SimpleController>(
              id: 'txtCount',
                builder: (controller){
                  return Text('Count value is ${controller.count}');
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.find<SimpleController>().increment();

                  simpleController.increment();
                },
                child: Text('Increment')),
             ],
        ),
      ),
    );
  }
}
