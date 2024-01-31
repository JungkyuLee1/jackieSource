import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/app_update_checker_controller.dart';

class AppUpdateCheckerPage extends GetView<AppUpdateCheckerController> {
  const AppUpdateCheckerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Update Checker'),
      ),
    );
  }
}
