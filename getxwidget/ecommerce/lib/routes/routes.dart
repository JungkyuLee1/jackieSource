import 'package:ecommerce/app/splash.dart';
import 'package:ecommerce/bindings/area_binding.dart';
import 'package:ecommerce/bindings/city_binding.dart';
import 'package:ecommerce/bindings/home_binding.dart';
import 'package:ecommerce/bindings/my_account_binding.dart';
import 'package:ecommerce/bindings/navigation_drawer_binding.dart';
import 'package:ecommerce/bindings/splash_binding.dart';
import 'package:ecommerce/bindings/state_binding.dart';
import 'package:ecommerce/pages/area_page.dart';
import 'package:ecommerce/pages/city_page.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/my_account_page.dart';
import 'package:ecommerce/pages/search_page.dart';
import 'package:ecommerce/pages/state_page.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => Splash(), binding: SplashBinding()),
    GetPage(name: '/state', page: () => StatePage(), binding: StateBinding()),
    GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: HomeBinding()),
        // binding: NavigationDrawerBinding()),
    GetPage(
      name: '/city',
      page: () => CityPage(),
      binding: CityBinding(),
    ),
    GetPage(name: '/area', page: () => AreaPage(), binding: AreaBinding()),
    GetPage(
        name: '/myAccount',
        page: () => MyAccountPage(),
        binding: MyAccountBinding()),
    GetPage(name: '/search', page: ()=>SearchPage(),
      binding: HomeBinding()
    ),
  ];
}
