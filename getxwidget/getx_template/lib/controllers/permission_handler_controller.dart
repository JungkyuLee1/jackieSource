import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/commons/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerController extends GetxController {
  var isPermission = false.obs;
  var trueCount = 0.obs;
  var latitude = ''.obs;
  var longitude = ''.obs;
  var address = ''.obs;
  late StreamSubscription<Position> streamSubscription;

  //Permission Handling
  void checkAndRequestPermission(
      {required Permission permission, required String authType}) async {
    final status = await PermissionHandler.checkAndRequestPermission(
        permission: permission, authType: authType);

    isPermission(status);
    if (isPermission.value) {
      //GeoLocator 권한 check

        await geoLocatorPermission().then((_) async {
          //Future로 권한 호출 처리까지 기다려 줌(매우 중요)
          await Future.delayed(Duration(milliseconds: 3000));

          print('address : ${address.value}');
          if (address.value.isNotEmpty) {
            Get.toNamed('/location');
          }
        });
    }
  }

  //집단 Permission
  void collectivePermission({required List<Permission> permissions}) async {
    final status = await PermissionHandler.collectivePermission(permissions);

    if (status) {
      Get.toNamed('/location');
    }
  }

  //GeoLocator & GeoCoding
  Future geoLocatorPermission() async {
      final result = await PermissionHandler.geoLocatorPermission();

      if (result == 'permitted') {
        streamSubscription =
            Geolocator.getPositionStream().listen((Position position) {
              latitude(position.latitude.toString());
              longitude(position.longitude.toString());

              getAddressFromLatLang(position);
            });
      } else {
        print('result : $result');
      }
  }

  //Address 가져오기
  Future<void> getAddressFromLatLang(Position position) async {
    try {
      List<Placemark> placeMarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark placeMark = placeMarks[0];

      address.value = '${placeMark.locality}, ${placeMark.country}';
      print('address-ori : $address');
    }catch(e){
      print('Exception : ${e.toString()}');
    }
  }

  @override
  void onClose() {
    super.onClose();
    streamSubscription.cancel();
  }
}


// Page에서 Call하는 방법
// ElevatedButton(
// onPressed: () async {
// if (Platform.isAndroid) {
// final androidInfo = await DeviceInfoPlugin().androidInfo;
//
// if (androidInfo.version.sdkInt <= 32) {
// controller.checkAndRequestPermission(
// permission: Permission.storage, authType: 'Photo');
// } else {
// controller.checkAndRequestPermission(
// permission: Permission.photos, authType: 'Photo');
// }
// }
//
// // controller.checkAndRequestPermission(permission: Permission.storage, authType: 'Photo');
// },
// child: Text('Image Permission'),
// style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
// ),