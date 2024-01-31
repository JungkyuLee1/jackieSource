import 'package:get/get.dart';
import 'package:group2_features/controllers/video_controller.dart';

class VideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoController());
  }
}
