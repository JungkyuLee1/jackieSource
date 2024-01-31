import 'package:feature_collection/app/splash_page.dart';
import 'package:feature_collection/bindings/bio_auth_binding.dart';
import 'package:feature_collection/bindings/image_picker_binding.dart';
import 'package:feature_collection/bindings/network_binding.dart';
import 'package:feature_collection/pages/bio_auth_page.dart';
import 'package:feature_collection/pages/internet_connect_page.dart';
import 'package:feature_collection/pages/multi_image_page.dart';
import 'package:get/get.dart';

import '../pages/image_picker_page.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashPage()),
    GetPage(
      name: '/internetConnect',
      page: () => InternetConnectPage(),
      binding: NetworkBinding(),
    ),
    GetPage(
      name: '/imagePicker',
      page: () => ImagePickerPage(),
      binding: ImagePickerBinding(),
    ),
    GetPage(
        name: '/multiImage',
        page: () => MultiImagePage(),
        binding: ImagePickerBinding.multiImageBinding()),
    GetPage(name: '/bioAuth', page: () => BioAuthPage(),
        binding: BioAuthBinding(),
    ),
  ];
}
