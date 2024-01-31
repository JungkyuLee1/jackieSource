import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/video_pick_controller.dart';

class VideoPickPage extends GetView<VideoPickController> {
  const VideoPickPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Trimmer'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.pickVideo();
          },
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.orange),
            child: Center(
                child: Text(
              'Pick Video',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
