import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:group4/common/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class AuthHandler {
  static Future<void> checkPermission(Permission permission) async {
    final status = await permission.request();

    if (status.isGranted) {
      Widgets.showSnackBar(
          'Permission', 'Permission is granted', Colors.white, Colors.green);
    } else {
      Widgets.showSnackBar(
          'Permission', 'Permission is denied', Colors.white, Colors.red);
    }
  }
}
