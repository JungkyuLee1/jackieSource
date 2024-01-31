import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/emojipicker_controller.dart';

class EmojiPickerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EmojiPickerController());
  }

}