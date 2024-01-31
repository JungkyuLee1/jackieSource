import 'package:get/get.dart';
import 'package:group8/controllers/shake_phone_controller.dart';

class ShakePhoneBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ShakePhoneController());
  }

}