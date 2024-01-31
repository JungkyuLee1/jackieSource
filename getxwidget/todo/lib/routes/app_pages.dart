import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../page/home_page.dart';

class AppPages{

  static const INITIAL = '/home';

  static final routes=[
    GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeController());
        })),
  ];
}