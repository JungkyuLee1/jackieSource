import 'package:get/get.dart';
import 'package:group2_features/controllers/scroll_cont_controller.dart';

class ScrollContBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollContController());
  }
}
