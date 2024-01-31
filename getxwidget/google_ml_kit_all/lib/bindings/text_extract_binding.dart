import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/text_extract_controller.dart';

class TextExtractBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TextExtractController());
  }

}