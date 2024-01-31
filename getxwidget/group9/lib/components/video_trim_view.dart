import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/video_trim_controller.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoTrimView extends GetView<VideoTrimController> {
  const VideoTrimView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Trimmer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(
              () => Visibility(
                  visible: controller.progressVisibility.value,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.red,
                  )),
            ),
            ElevatedButton(
                onPressed: controller.progressVisibility.value
                    ? null
                    : () {
                        controller.saveVideo();
                      },
                child: Text('Save')),
            Expanded(child: VideoViewer(trimmer: controller.trimmer)),
            Center(
              child: TrimViewer(
                trimmer: controller.trimmer,
                viewerHeight: 50,
                viewerWidth: Get.width,
                maxVideoLength: Duration(
                    seconds: controller.trimmer.videoPlayerController!.value
                        .duration.inSeconds),
                onChangeStart: (value) {
                  controller.startValue.value = value;
                },
                onChangeEnd: (value) {
                  controller.endValue.value = value;
                },
                onChangePlaybackState: (value) {
                  //play 시 true
                  controller.isPlaying.value = value;
                },
              ),
            ),
            Obx(
              () => TextButton(
                  onPressed: () async {
                    bool playbackState = await controller.trimmer
                        .videoPlaybackControl(
                            startValue: controller.startValue.value,
                            endValue: controller.endValue.value);
                    //play 시 true
                    controller.isPlaying.value = playbackState;
                  },
                  child: controller.isPlaying.value
                      ? Icon(
                          Icons.pause,
                          size: 80,
                          color: Colors.black,
                        )
                      : Icon(Icons.play_arrow, size: 80, color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
