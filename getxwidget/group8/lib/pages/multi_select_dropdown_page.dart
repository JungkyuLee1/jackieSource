import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/multi_select_dropdown_controller.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelectDropDownPage extends GetView<MultiSelectDropDownController> {
  const MultiSelectDropDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Select DropDown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropDownMultiSelect(
              whenEmpty: 'Select State Management Library',
                options: controller.options,
                selectedValues: controller.selectedOptions.value,
                onChanged: (value) {
                  controller.selectedOptions.value = value;
                  controller.selectedOption.value = '';

                  controller.selectedOptions.value.forEach((element) {
                    controller.selectedOption.value =
                        controller.selectedOption.value + ', ' + element;
                  });
                }),
            SizedBox(height: 20,),
            Obx(()=> Text(controller.selectedOption.value))
          ],
        ),
      ),
    );
  }
}
