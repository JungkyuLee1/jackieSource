import 'package:get/get.dart';
import 'package:google_ml_kit_all/controllers/scan_barcode_qr_controller.dart';

class ScanBarcodeQrBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ScanBarcodeQrController());
  }

}