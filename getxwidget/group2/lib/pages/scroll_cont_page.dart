import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/scroll_cont_controller.dart';

class ScrollContPage extends GetView<ScrollContController> {
  const ScrollContPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Controller'),
        actions: [
          IconButton(
              onPressed: () {
                controller.scrollUp();
              },
              icon: Icon(Icons.arrow_circle_up)),
          IconButton(
              onPressed: () {
                controller.scrollDown();
              },
              icon: Icon(Icons.arrow_circle_down)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Obx(() => Text(
                  '${controller.scrollMessage}',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.red),
            child: Obx(
              () => Text(
                '${controller.scrollNotificationMessage}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  controller.startScroll();
                } else if (scrollNotification is ScrollUpdateNotification) {
                  controller.updateScroll();
                } else if (scrollNotification is ScrollEndNotification) {
                  controller.endScroll();
                }
                return true;
              },
              child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item index is : $index'),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
