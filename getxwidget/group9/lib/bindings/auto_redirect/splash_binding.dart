import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}