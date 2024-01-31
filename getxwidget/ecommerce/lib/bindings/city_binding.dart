import 'package:ecommerce/controllers/city_controller.dart';
import 'package:ecommerce/repositories/city_repository.dart';
import 'package:get/get.dart';

class CityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CityRepository());
    Get.put(CityController());
    // Get.lazyPut(() => CityController());
  }
}
