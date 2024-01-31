import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/barcode_extract_controller.dart';

class BarcodeExtractBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BarcodeExtractController());
  }

}