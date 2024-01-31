import 'package:get/get.dart';
import 'package:group6_withpermission/app/splash.dart';
import 'package:group6_withpermission/bindings/dropdown_binding.dart';
import 'package:group6_withpermission/bindings/location_binding.dart';
import 'package:group6_withpermission/bindings/password_binding.dart';
import 'package:group6_withpermission/bindings/permission_handler_binding.dart';
import 'package:group6_withpermission/pages/drawer/chat_page.dart';
import 'package:group6_withpermission/pages/drawer/home_page.dart';
import 'package:group6_withpermission/pages/drawer/photo_page.dart';
import 'package:group6_withpermission/pages/drawer/video_page.dart';
import 'package:group6_withpermission/pages/dropdown_page.dart';
import 'package:group6_withpermission/pages/location_page.dart';
import 'package:group6_withpermission/pages/passwordPage.dart';
import 'package:group6_withpermission/pages/permission_handler_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static final settings = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(
        name: '/location',
        page: () => LocationPage(),
        binding: LocationBinding()),
    GetPage(
        name: '/permissionHandler',
        page: () => PermissionHandlerPage(),
        binding: PermissionHandlerBinding()),
    GetPage(
        name: '/dropdown',
        page: () => DropDownPage(),
        binding: DropDownBinding()),
    GetPage(
      name: '/password',
      page: () => PasswordPage(),
      binding: PasswordBinding(),
    ),
    GetPage(name: '/drawer', page: () => HomePage()),
    GetPage(name: '/photo', page: () => PhotoPage()),
    GetPage(name: '/video', page: () => VideoPage()),
    GetPage(name: '/chat', page: () => ChatPage()),
  ];
}
