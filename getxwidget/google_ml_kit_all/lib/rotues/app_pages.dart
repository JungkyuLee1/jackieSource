import 'package:get/get.dart';
import 'package:google_ml_kit_all/app/splash_page.dart';
import 'package:google_ml_kit_all/bindings/barcode_extract_binding.dart';
import 'package:google_ml_kit_all/bindings/labeling_binding.dart';
import 'package:google_ml_kit_all/bindings/scan_barcode_qr_binding.dart';
import 'package:google_ml_kit_all/bindings/text_extract_binding.dart';
import 'package:google_ml_kit_all/pages/barcode_extract_page.dart';
import 'package:google_ml_kit_all/pages/labeling_page.dart';
import 'package:google_ml_kit_all/pages/scan_barcode_qr_page.dart';
import 'package:google_ml_kit_all/pages/text_extract_page.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashPage()),
    GetPage(
      name: '/textExtract',
      page: () => TextExtractPage(),
      binding: TextExtractBinding(),
    ),
    GetPage(
      name: '/scanBarcode',
      page: () => ScanBarcodeQrPage(),
      binding: ScanBarcodeQrBinding(),
    ),
    GetPage(
      name: '/barCode',
      page: () => BarcodeExtractPage(),
      binding: BarcodeExtractBinding(),
    ),
    GetPage(
      name: '/labeling',
      page: () => LabelingPage(),
      binding: LabelingBinding(),
    ),
  ];
}
