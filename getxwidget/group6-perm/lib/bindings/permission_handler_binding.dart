import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/permission_handler_controller.dart';

class PermissionHandlerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PermissionHandlerController());
  }

}