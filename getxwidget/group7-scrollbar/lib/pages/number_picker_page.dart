import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/number_picker_controller.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerPage extends GetView<NumberPickerController> {
  const NumberPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Picker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => NumberPicker(
              value: controller.currentValue.value,
              minValue: 18,
              maxValue: 100,
              onChanged: (value) {
                controller.currentValue.value = value;
              },
              selectedTextStyle:
                  TextStyle(fontSize: 30, color: Colors.deepPurpleAccent),
              axis: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() => Text(
                'Current Value : ${controller.currentValue.value}',
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
