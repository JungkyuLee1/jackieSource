import 'package:get/get.dart';
import 'package:group4/controllers/qr_code_controller.dart';

class QrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrCodeController());
  }
}
