import 'package:get/get.dart';
import 'package:group9/controllers/sms_code_controller.dart';

class SmsCodeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SmsCodeController());
  }

}