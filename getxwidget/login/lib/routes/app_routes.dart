import 'package:get/get.dart';
import 'package:login/app/splash.dart';
import 'package:login/bindings/login_binding.dart';
import 'package:login/bindings/welcome_binding.dart';
import 'package:login/pages/login_page.dart';
import 'package:login/pages/welcome_page.dart';

class Routes {
  static const INITIAL = '/splash';

  static final settings = [
    GetPage(name: '/splash', page: () => Splash()),
    GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: '/welcome', page: () => WelcomePage(), binding: WelcomeBinding()),
  ];
}
