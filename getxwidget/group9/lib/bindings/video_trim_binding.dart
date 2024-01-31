import 'package:get/get.dart';
import 'package:group9/controllers/video_pick_controller.dart';
import 'package:group9/controllers/video_trim_controller.dart';

class VideoTrimBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(VideoPickController());
    // Get.lazyPut(() => VideoPickController());
    Get.lazyPut(() => VideoTrimController());
  }

}