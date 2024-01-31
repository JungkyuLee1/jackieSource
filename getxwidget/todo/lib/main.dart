import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/bindings/home_binding.dart';
import 'package:todo/controller/home_controller.dart';
import 'package:todo/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: () => HomePage(),
            binding: HomeBinding(),
            // binding: BindingsBuilder(() {
            //   // Get.lazyPut(() => HomeController());
            //   Get.put(HomeController());
            // }),
          ),
        ]);
  }
}

// GetPage(
// name: '/binding',
// page: () => BindingPage(),
// binding: BindingsBuilder(() {
// Get.put(CountControllerWithReactiveGetX());
// }))