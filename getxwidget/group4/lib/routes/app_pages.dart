import 'package:get/get.dart';
import 'package:group4/app/splash.dart';
import 'package:group4/bindings/custom_loader_binding.dart';
import 'package:group4/bindings/method_channel_binding.dart';
import 'package:group4/bindings/qr_code_binding.dart';
import 'package:group4/bindings/reorderable_binding.dart';
import 'package:group4/pages/custom_loader_page.dart';
import 'package:group4/pages/javascript_page.dart';
import 'package:group4/pages/keyboard_hide.dart';
import 'package:group4/pages/method_channel_page.dart';
import 'package:group4/pages/permission_handler_page.dart';
import 'package:group4/pages/qr_code_page.dart';
import 'package:group4/pages/reorderable_page.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
      name: '/reorderable',
      page: () => ReOrderAblePage(),
      binding: ReOrderAbleBinding(),
    ),
    GetPage(name: '/permission', page: () => PermissionHandlerPage()),
    GetPage(
        name: '/methodChannel',
        page: () => MethodChannelPage(),
        binding: MethodChannelBinding()),
    GetPage(name: '/callJavascript', page: () => JavaScriptPage()),
    GetPage(name: '/keyboardHide', page: () => KeyboardHidePage()),
    GetPage(
      name: '/qrCode',
      page: () => QrCodePage(),
      binding: QrCodeBinding(),
    ),
    GetPage(
      name: '/customLoader',
      page: () => CustomLoaderPage(),
      binding: CustomLoaderBinding(),
    ),
  ];
}
