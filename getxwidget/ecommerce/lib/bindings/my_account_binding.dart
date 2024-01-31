import 'package:ecommerce/controllers/my_account_controller.dart';
import 'package:ecommerce/controllers/navigation_drawer_controller.dart';
import 'package:get/get.dart';

class MyAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyAccountController());
    Get.put(NavigationDrawerController());
  }

}