import 'package:ecommerce/controllers/area_controller.dart';
import 'package:ecommerce/repositories/area_repository.dart';
import 'package:get/get.dart';

class AreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AreaRepository());
    Get.lazyPut(() => AreaController());
  }
}
