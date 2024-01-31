import 'package:get/get.dart';
import 'package:login/controllers/email_login_controller.dart';
import 'package:login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => EmailLoginController());
  }
}
