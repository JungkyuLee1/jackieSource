import 'package:get/get.dart';
import 'package:group9/controllers/multi_image_controller.dart';

class MultiImageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MultiImageController());

  }

}