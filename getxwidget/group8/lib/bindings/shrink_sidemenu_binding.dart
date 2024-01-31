import 'package:get/get.dart';
import 'package:group8/controllers/shrink_sidemenu_controller.dart';

class ShrinkSideMenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ShrinkSideMenuController());
  }

}