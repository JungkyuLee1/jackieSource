import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/labeling_controller.dart';

class LabelingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LabelingController());
  }

}