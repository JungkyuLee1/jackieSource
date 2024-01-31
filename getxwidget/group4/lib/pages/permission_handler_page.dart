import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:group4/authorities/auth_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerPage extends StatelessWidget {
  const PermissionHandlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //SDK version에 따라 Permission 을 다르게 해줘야 함(AndroidManifest.xml 에 사전 등록 필수)
            if(Platform.isAndroid) {
              final androidInfo = await DeviceInfoPlugin().androidInfo;

              if(androidInfo.version.sdkInt <=32){
                AuthHandler.checkPermission(Permission.storage);
              }else{
                AuthHandler.checkPermission(Permission.photos);
              }
            }
          },
          child: Text('Check Permission'),
        ),
      ),
    );
  }
}
