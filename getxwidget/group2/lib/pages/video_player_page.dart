import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group2_features/controllers/video_controller.dart';

class VideoPlayerPage extends GetView<VideoController> {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.chewieController.value != null &&
                      controller.chewieController.value.videoPlayerController
                          .value.isInitialized
                  ? Chewie(controller: controller.chewieController.value)
                  : Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Loading..'),
                      ],
                    )
            ],
          ),
        ),
      ),

      //     body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     GetBuilder(
      //         init: VideoController(),
      //         builder: (controller) {
      //           return Center(
      //               child: controller.chewieController != null &&
      //                       controller.chewieController!.videoPlayerController
      //                           .value.isInitialized
      //                   ? Chewie(controller: controller.chewieController!)
      //                   : Column(
      //                       children: [
      //                         CircularProgressIndicator(),
      //                         SizedBox(
      //                           height: 10,
      //                         ),
      //                         Text('Loading..')
      //                       ],
      //                     ));
      //         }),
      //   ],
      // )
    );
  }
}
