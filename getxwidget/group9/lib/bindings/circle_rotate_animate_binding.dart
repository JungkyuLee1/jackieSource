import 'package:get/get.dart';
import 'package:group9/controllers/circle_rotate_animate_controller.dart';

class CircleRotateAnimateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CircleRotateAnimateController());
  }

}