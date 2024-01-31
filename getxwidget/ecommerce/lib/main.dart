import 'package:ecommerce/app/splash.dart';
import 'package:ecommerce/bindings/network_binding.dart';
import 'package:ecommerce/common/theme/app_theme.dart';
import 'package:ecommerce/common/utils/theme_helper.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkBinding().dependencies();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: Routes.routes,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeHelper().theme,
      defaultTransition: Transition.leftToRightWithFade,
    );
  }
}
