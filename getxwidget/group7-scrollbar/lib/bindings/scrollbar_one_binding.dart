import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/scrollbar_one_controller.dart';

class ScrollbarOneBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollbarOneController());
  }

}