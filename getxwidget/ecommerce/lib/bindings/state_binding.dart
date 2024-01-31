import 'package:ecommerce/controllers/state_controller.dart';
import 'package:ecommerce/repositories/state_repository.dart';
import 'package:get/get.dart';

class StateBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StateRepository());
    Get.put(StateController());
  }

}