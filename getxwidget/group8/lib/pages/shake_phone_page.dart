import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/shake_phone_controller.dart';

class ShakePhonePage extends GetView<ShakePhoneController> {
  const ShakePhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: controller.color.value,
          title: Text('Color Change-Phone Shake'),
          elevation: 0.0,
        ),
        backgroundColor: controller.color.value,
        body: Center(
          child: Column(
            children: [
              Text(
                'Shake Phone to change color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Obx(
                ()=> Text(
                  'Count : ${controller.count.value}'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
