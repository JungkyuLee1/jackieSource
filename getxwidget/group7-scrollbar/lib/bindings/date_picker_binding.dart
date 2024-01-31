import 'package:get/get.dart';
import 'package:group7_scrollbar/controllers/date_picker_controller.dart';

class DatePickerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DatePickerController());
  }

}