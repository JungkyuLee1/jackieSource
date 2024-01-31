import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/copy_paste_controller.dart';

class CopyPasteBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CopyPasteController());
  }

}