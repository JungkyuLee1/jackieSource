import 'package:get/get.dart';
import 'package:responsive_layout/bindings/home_binding.dart';
import 'package:responsive_layout/pages/home_page.dart';

import '../app/splash.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
  ];
}
