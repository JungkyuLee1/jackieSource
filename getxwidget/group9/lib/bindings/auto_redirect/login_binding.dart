import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}