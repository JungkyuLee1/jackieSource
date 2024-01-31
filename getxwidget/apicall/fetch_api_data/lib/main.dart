import 'package:fetch_api_data/binding/init_binding.dart';
import 'package:fetch_api_data/controller/email_storage_cotroller.dart';
import 'package:fetch_api_data/controller/product_controller.dart';
import 'package:fetch_api_data/page/email_storage_page.dart';
import 'package:fetch_api_data/page/product_list_page.dart';
import 'package:fetch_api_data/routes/app_pages.dart';
import 'package:fetch_api_data/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  //Storage 초기화
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'API Call',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      themeMode: ThemeMode.dark,
      initialBinding: InitBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
