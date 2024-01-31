import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/dropdown_controller.dart';

class DropDownPage extends GetView<DropDownController> {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dropdown with server'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            physics: ScrollPhysics(parent: BouncingScrollPhysics()),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Obx(
                    () => DropdownButtonFormField(
                        isDense: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          controller.validateZone(val!.toString());
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        items: controller.lstZoneDropDownMenuItem.value,
                        value: controller.selectedZoneId.value,
                        hint: Text(
                          'Select Zone',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (selectedValue) {
                          controller.selectedZoneId.value =
                              selectedValue.toString();

                          if(controller.selectedZoneId.value != '0'){
                            controller.getState(controller.selectedZoneId.value);
                          }
                        }),
                  ),
                  SizedBox(height: 20,),
                  Obx(
                    () => DropdownButtonFormField(
                        isDense: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) {
                          controller.validateState(val.toString());
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        hint: Text(
                          'Select State',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        items: controller.lstStateDropDownMenuItem.value,
                        value: controller.selectedStateId.toString(),
                        onChanged: (selectedValue) {
                          controller.selectedStateId.value =
                              selectedValue.toString();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
