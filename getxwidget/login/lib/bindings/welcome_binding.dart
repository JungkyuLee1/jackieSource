import 'package:get/get.dart';
import 'package:login/controllers/welcome_contoller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
