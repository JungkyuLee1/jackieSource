import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}