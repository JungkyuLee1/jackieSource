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
                      Get.toNamed('/speechToText');
                    },
                    child: Text('Speech To Text')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/carouselSlider');
                //     },
                //     child: Text('Carousel Slider')),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed('/videoPlayer');
                //     },
                //     child: Text('video Play(Chewie)')),
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
