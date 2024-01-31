import 'package:get/get.dart';
import 'package:group8/controllers/fab_circular_controller.dart';

class FabCircularBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FabCircularController());
  }

}