import 'package:get/get.dart';
import 'package:group8/controllers/rating_dialog_controller.dart';

class RatingDialogBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RatingDialogController());
  }

}