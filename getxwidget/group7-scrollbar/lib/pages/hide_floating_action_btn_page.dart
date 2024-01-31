import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/hide_floating_action_btn_controller.dart';

class HideFloatingActionBtnPage
    extends GetView<HideFloatingActionBtnController> {
  const HideFloatingActionBtnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //아래 textfield 클릭 시 true로 변함
    controller.showFab.value = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              'Hide Floating Action Button : \n ${controller.showFab.value}'),
        ),
        body: Center(
          child: TextField(
            focusNode: controller.focusNode,
          ),
        ),
        floatingActionButton: Obx(
          () => Visibility(
            visible: !controller.showFab.value,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
