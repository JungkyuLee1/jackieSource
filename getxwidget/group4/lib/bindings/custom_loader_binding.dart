import 'package:get/get.dart';
import 'package:group4/controllers/custom_loader_controller.dart';
import 'package:group4/repositories/custom_repository.dart';

class CustomLoaderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CustomLoaderController());
    Get.lazyPut(() => CustomRepository());
  }

}