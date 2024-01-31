import 'package:get/get.dart';
import 'package:group8/controllers/multi_select_dropdown_controller.dart';

import '../controllers/multi_select_dialog_controller.dart';

class MultiSelectBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MultiSelectDialogController());
    Get.lazyPut(() => MultiSelectDropDownController());
  }

}