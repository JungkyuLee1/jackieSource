import 'package:get/get.dart';
import 'package:group8/controllers/flip_card_controller.dart';
import 'package:group8/controllers/loading_btn_indicator_controller.dart';

class LoadingBtnIndicatorBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoadingBtnIndicatorController());
    Get.lazyPut(() => FlipCardHandleController());
  }

}