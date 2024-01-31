import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/multi_line_select_controller.dart';

class MultiLineSelectPage extends GetView<MultiLineSelectController> {
  const MultiLineSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Line Select'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: controller.members.length,
                itemBuilder: (context, index) {
                  final member = controller.members[index];

                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        member.isSelected.value = !member.isSelected.value;
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 16, right: 16, top: 4, bottom: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: member.isSelected.value
                                ? Colors.green[200]
                                : Colors.white),
                        child: Text(member.name),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
