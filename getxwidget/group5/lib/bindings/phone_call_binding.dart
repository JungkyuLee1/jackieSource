import 'package:get/get.dart';
import 'package:group5/controllers/phone_call_controller.dart';

class PhoneCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhoneCallController());
  }
}
