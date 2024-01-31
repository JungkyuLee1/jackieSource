import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/scrollbar_one_controller.dart';

class ScrollbarScrollablePage extends GetView<ScrollbarOneController> {
  const ScrollbarScrollablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollbar to Scrollable Widget'),
      ),
      // body: Scrollbar(
      //   thickness: 10,
      body: RawScrollbar(
        controller: controller.scrollController,
        thumbVisibility: true,
        thumbColor: Colors.red,
        thickness: 10,
        child: ListView.builder(
            controller: controller.scrollController,
            itemCount: 50,
            itemBuilder: (context, index){
              return Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: Center(child: Text(index.toString())),
              );
            }),
      ),
    );
  }
}
