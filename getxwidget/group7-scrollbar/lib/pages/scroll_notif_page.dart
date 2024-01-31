import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/scroll_notif_controller.dart';

class ScrollNotifPage extends GetView<ScrollNotifController> {
  const ScrollNotifPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Controller/ScrollNotification'),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Obx(
              () => Text(
                controller.scrollMessage.value,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Obx(
              () => Text(
                controller.scrollNotificationMessage.value,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  controller.start();
                } else if (scrollNotification is ScrollUpdateNotification) {
                  controller.updateScroll();
                } else if (scrollNotification is ScrollEndNotification) {
                  controller.end();
                }
                return false;
              },
              child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.blue,
                      child: Center(child: Text(index.toString())),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
