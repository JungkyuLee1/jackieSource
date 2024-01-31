import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/draggable_controller.dart';

class DraggablePage extends GetView<DraggableController> {
  const DraggablePage({Key? key}) : super(key: key);

  _header() {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.purple,
      child: Text(
        'Draggable Scrollable Sheet Demo',
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  _draggableScrollable() {
    return DraggableScrollableSheet(
      builder: (BuildContext buildContext, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: ListView.builder(
              controller: scrollController,
              itemCount: controller.selected.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Material(
                    type: MaterialType.transparency,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 17,
                        child: Text(
                          index.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        'Index position is $index',
                        style: TextStyle(
                            color: controller.selected[index]
                                ? Colors.white
                                : Colors.black),
                      ),
                      selectedTileColor: controller.selected[index]
                          ? Colors.blue
                          : Colors.greenAccent,
                      selected: controller.selected[index],
                      onTap: () => controller.selected[index] =
                          !controller.selected[index],
                    ),
                  ),
                );
              }),
        );
      },
      initialChildSize: .3,
      minChildSize: .15,
      maxChildSize: .9,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Draggable Scrollable Sheet'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _header(),
          _draggableScrollable(),
        ],
      ),
    );
  }
}
