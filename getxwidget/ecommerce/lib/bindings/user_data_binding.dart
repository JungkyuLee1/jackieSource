import 'package:ecommerce/controllers/user_data_controller.dart';
import 'package:ecommerce/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserDataBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UserRepository());
    Get.lazyPut(() => UserDataController());
  }

}