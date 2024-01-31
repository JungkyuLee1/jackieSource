import 'package:get/get.dart';
import 'package:group4/controllers/method_channel_controller.dart';

class MethodChannelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MethodChannelController());
  }
}
