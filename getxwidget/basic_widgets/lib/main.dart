import 'package:basic_widget/RouteTest/route_test_home_page.dart';
import 'package:basic_widget/RouteTest/route_test_main_page.dart';
import 'package:basic_widget/RouteTest/route_test_next_page.dart';
import 'package:basic_widget/RouteTest/unknown_route_page.dart';
import 'package:basic_widget/bottomSheet_page.dart';
import 'package:basic_widget/controller/async_controller.dart';
import 'package:basic_widget/controller/getx_service_controller.dart';
import 'package:basic_widget/controller/international_controller.dart';
import 'package:basic_widget/controller/messages.dart';
import 'package:basic_widget/international_page.dart';
import 'package:basic_widget/put_async_page.dart';
import 'package:basic_widget/showDialog_page.dart';
import 'package:basic_widget/snackbar_page.dart';
import 'package:basic_widget/splash_page.dart';
import 'package:basic_widget/state_management/controller/reactive_controller.dart';
import 'package:basic_widget/state_management/controller/simple_controller.dart';
import 'package:basic_widget/state_management/controller/worker_controller.dart';
import 'package:basic_widget/state_management/reactive_state_mgmt_page.dart';
import 'package:basic_widget/state_management/simple_state_mgmt_page.dart';
import 'package:basic_widget/state_management/workers_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()  async{
  await initServices();
  runApp(const MyApp());
}

//GetXService Test 목적
Future<void> initServices() async{
  await Get.putAsync(() async=> await GetXServiceController());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      // locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      // home: BottomSheetPage(),
      initialRoute: '/splash',
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/snackBar', page: () => SnackBarPage()),
        GetPage(name: '/showDialog', page: () => ShowDialogPage()),
        GetPage(name: '/bottomSheet', page: () => BottomSheetPage()),
        GetPage(name: '/routeTestMain', page: () => RouteTestMainPage()),
        GetPage(name: '/routeTestHome', page: () => RouteTestHomePage()),
        GetPage(
            name: '/next/:someValue',
            page: () => NextPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/reactive',
            page: () => ReactiveStateMgmtPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => ReactiveController());
            })),
        GetPage(
          name: '/simple',
          page: () => SimpleStateMgmtPage(),
        ),
        GetPage(
            name: '/worker',
            page: () => WorkersPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => WorkerController());
            })),
        GetPage(
            name: '/international',
            page: () => InternationalPage(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => InternationalController());
            })),
        GetPage(
            name: '/putAsync',
            page: () => PutAsyncPage(),
            binding: BindingsBuilder(() {
              Get.putAsync<AsyncController>(() async => AsyncController());
            })),
      ],
      //initial route가 '/'이면 '/'로 이동 함
      unknownRoute: GetPage(name: '/notFound', page: () => UnknownRoutePage()),
      // home: SnackBarPage(),
    );
  }
}
