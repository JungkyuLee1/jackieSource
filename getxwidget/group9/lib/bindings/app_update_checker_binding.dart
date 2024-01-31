import 'package:get/get.dart';
import 'package:group9/controllers/app_update_checker_controller.dart';

class AppUpdateCheckerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AppUpdateCheckerController());
    // Get.lazyPut(() => AppUpdateCheckerController());
  }

}