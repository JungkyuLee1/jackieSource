import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/dropdown_controller.dart';
import 'package:group6_withpermission/repositories/dropdown_repository.dart';

class DropDownBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => DropDownRepository());
    // Get.lazyPut(() => DropDownController());
    Get.put(DropDownRepository());
    Get.put(DropDownController());
  }

}