import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/password_controller.dart';

class PasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }

}