import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/hide_floating_action_btn_controller.dart';

class HideFloatingActionBtnBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HideFloatingActionBtnController());
  }

}