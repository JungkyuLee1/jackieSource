import 'package:get/get.dart';
import 'package:group9/controllers/multi_line_select_controller.dart';

class MultiLineSelectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MultiLineSelectController());
  }

}