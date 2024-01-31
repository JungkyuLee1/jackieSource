import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/phoneCall');
                    },
                    child: Text('Phone No. Copy')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/tabBarCustomPainter');
                    },
                    child: Text('TabBar & Custom Painter')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/scratcher');
                    },
                    child: Text('Scratcher')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/draggable');
                //     },
                //     child: Text('Draggable Scrollable')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/validateForm');
                //     },
                //     child: Text('Form Validation')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/draggableDrag');
                //     },
                //     child: Text('Draggable Drag')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/dragGame');
                //     },
                //     child: Text('Draggable Drag(Game)')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
