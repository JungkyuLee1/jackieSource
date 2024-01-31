import 'package:fetch_api_data/controller/statemixin_controller.dart';
import 'package:fetch_api_data/repository/user_repository.dart';
import 'package:get/instance_manager.dart';

class StateMixingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateMixinController>(() => StateMixinController());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}
