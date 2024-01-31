import 'package:ecommerce/controllers/network_controller.dart';
import 'package:ecommerce/repositories/user_repository.dart';
import 'package:get/get.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkController());
  }

}