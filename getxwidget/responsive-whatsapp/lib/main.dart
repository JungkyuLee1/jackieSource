import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_whatsapp/src/common/values/app_color.dart';
import 'package:responsive_whatsapp/src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Whatsapp UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          backgroundColor: backgroundColor,
          ),
      initialRoute: Routes.INITIAL,
      getPages: Routes.routes,
    );
  }
}
