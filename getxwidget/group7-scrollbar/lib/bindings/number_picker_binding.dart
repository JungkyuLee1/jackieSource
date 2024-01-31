import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/number_picker_controller.dart';

class NumberPickerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NumberPickerController());
  }

}