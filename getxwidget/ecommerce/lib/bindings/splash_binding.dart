import 'package:ecommerce/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
    // Get.lazyPut(() => SplashController());
  }

}