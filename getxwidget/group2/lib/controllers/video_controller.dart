import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  late VideoPlayerController  videoPlayerController;
  //GetBuilder
  // ChewieController? chewieController;

  var chewieController=ChewieController(videoPlayerController: VideoPlayerController.networkUrl(Uri.parse('uri'))).obs;

  @override
  void onInit() {
    super.onInit();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4'));

    await Future.wait([videoPlayerController.initialize()]);
    chewieController.value = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.cyanAccent,
            backgroundColor: Colors.yellow,
            bufferedColor: Colors.deepPurple),
        placeholder: Container(
          color: Colors.blueGrey,
        ),
        autoInitialize: true);

    //GetBuilder 용
    // update();
  }
}
