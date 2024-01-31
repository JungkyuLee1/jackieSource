import 'package:get/get.dart';
import 'package:group5/app/splash.dart';
import 'package:group5/bindings/phone_call_binding.dart';
import 'package:group5/bindings/scratcher_binding.dart';
import 'package:group5/bindings/tabBar_customPainter_binding.dart';
import 'package:group5/pages/phone_direct_call_page.dart';
import 'package:group5/pages/scratcher_page.dart';
import 'package:group5/pages/tabBar_customPainter_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static final settings = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
      name: '/phoneCall',
      page: () => PhoneDirectCallPage(),
      binding: PhoneCallBinding(),
    ),
    GetPage(
      name: '/tabBarCustomPainter',
      page: () => TabBarCustomPainterPage(),
      binding: TabBarCustomPainterBinding(),
    ),
    GetPage(
        name: '/scratcher',
        page: () => ScratcherPage(),
        binding: ScratcherBinding()),
  ];
}
