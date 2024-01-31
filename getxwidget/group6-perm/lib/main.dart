import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Latitude & Longitude',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: Routes.settings,
    );
  }
}
