import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/controllers/permission_handler_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPage extends GetView<PermissionHandlerController> {
  const PermissionHandlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.checkAndRequestPermission(
                      permission: Permission.camera, authType: 'Camera');
                },
                child: Text('Camera Permission'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (Platform.isAndroid) {
                    final androidInfo = await DeviceInfoPlugin().androidInfo;

                    if (androidInfo.version.sdkInt <= 32) {
                      controller.checkAndRequestPermission(
                          permission: Permission.storage, authType: 'Photo');
                    } else {
                      controller.checkAndRequestPermission(
                          permission: Permission.photos, authType: 'Photo');
                    }
                  }

                  // controller.checkAndRequestPermission(permission: Permission.storage, authType: 'Photo');
                },
                child: Text('Image Permission'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.collectivePermission(
                      permissions: [Permission.camera, Permission.storage]);
                },
                child: Text('Multiple Permission'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
