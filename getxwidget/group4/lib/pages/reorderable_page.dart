import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group4/controllers/reorderable_controller.dart';

class ReOrderAblePage extends GetView<ReOrderAbleController> {
  const ReOrderAblePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReOrderAble ListView'),
      ),
      body: Obx(
        () => ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            controller.reorder(oldIndex, newIndex);
          },
          children: controller.myFavs
              .map(
                (fav) => Container(
                  key: ValueKey(fav),
                  margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.lightBlue),
                  child: Text(
                    fav,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
