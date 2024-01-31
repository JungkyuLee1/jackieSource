import 'package:get/get.dart';
import 'package:group8/controllers/panorama_image_controller.dart';

class PanoramaImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PanoramaImageController());
  }

}