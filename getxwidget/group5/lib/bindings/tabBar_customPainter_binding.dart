import 'package:get/get.dart';
import 'package:group5/controllers/custom_painter_controller.dart';
import 'package:group5/controllers/image_paint_controller.dart';
import 'package:group5/controllers/tabBar_controller.dart';

class TabBarCustomPainterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabBarController());
    Get.lazyPut(() => CustomPainterController());
    Get.lazyPut(() => ImagePaintController());
  }
}
