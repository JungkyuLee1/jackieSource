import 'package:get/get.dart';
import 'package:group9/controllers/like_button_controller.dart';

class LikeButtonBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LikeButtonController());
  }

}