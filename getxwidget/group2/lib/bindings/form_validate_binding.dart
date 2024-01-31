import 'package:get/get.dart';
import 'package:group2_features/controllers/form_validate_controller.dart';

class FormValidateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FormValidateController());
  }
}
