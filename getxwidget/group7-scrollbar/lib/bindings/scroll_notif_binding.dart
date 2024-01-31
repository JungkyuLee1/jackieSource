import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/scroll_notif_controller.dart';

class ScrollNotifBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollNotifController());
  }
}