import 'package:ecommerce/controllers/navigation_drawer_controller.dart';
import 'package:ecommerce/repositories/user_repository.dart';
import 'package:get/get.dart';

class NavigationDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationDrawerController());
    // Get.put(UserRepository());
  }
}
