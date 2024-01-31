import 'package:feature_collection/controllers/network_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
  }
}
