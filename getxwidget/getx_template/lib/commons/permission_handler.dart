import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

import '../components/dialog_pop_up.dart';

class PermissionHandler {
  //개별 권한
  static Future<bool> checkAndRequestPermission(
      {required Permission permission, required String authType}) async {
    final status = await permission.request();

    if (status == PermissionStatus.denied) {
      print('Permission denied');
      if (authType == 'Photo') authType = 'storage';

      Get.dialog(DialogPopup("Can't Access $authType",
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));

      return false;
    } else if (status == PermissionStatus.limited) {
      print('Permission is Limited');

      Get.dialog(DialogPopup('Allow us to use $authType',
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));
      return false;
    } else if (status == PermissionStatus.restricted) {
      print('Permission is Restricted');

      Get.dialog(DialogPopup('Allow us to use $authType',
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));
      return false;
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission is permanently denied');

      Get.dialog(DialogPopup("Can't use $authType",
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));
      return false;
    }
    return true;
  }

  //집단 권한
  static Future<bool> collectivePermission(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> multiStatus = await permissions.request();

    bool isCamera = false;
    bool isStorage = false;

    if (multiStatus[Permission.camera]!.isGranted) {
      print('Camera Permission is Granted');
      isCamera = true;

      if (multiStatus[Permission.storage]!.isGranted) {
        print('Photo Permission is Granted');
        isStorage = true;
      } else if (multiStatus[Permission.storage]!.isDenied) {
        print('Permission Denied');

        Get.dialog(DialogPopup("Can't Access Photo",
            buttonText: 'Open App Settings', okCallback: () {
          openAppSettings();
        }));
        isStorage = false;
      } else if (multiStatus[Permission.storage]!.isPermanentlyDenied) {
        print('Permission is permanently denied');

        Get.dialog(DialogPopup("Can't Access Photo",
            buttonText: 'Open App Settings', okCallback: () {
          openAppSettings();
        }));
        isStorage = false;
      }
    } else if (multiStatus[Permission.camera]!.isDenied) {
      print('Permission Denied');

      Get.dialog(DialogPopup("Can't Access Camera",
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));
      isCamera = false;
    } else if (multiStatus[Permission.camera]!.isPermanentlyDenied) {
      print('Permission is permanently denied');

      Get.dialog(DialogPopup("Can't Access Camera",
          buttonText: 'Open App Settings', okCallback: () {
        openAppSettings();
      }));
      isCamera = false;
    }

    if (isCamera == true && isStorage == true) {
      return true;
    } else {
      return false;
    }
  }

  //GeoLocator Permission
  static Future geoLocatorPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      } else if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      //성공 시
      return Future.value('permitted');
  }
}
