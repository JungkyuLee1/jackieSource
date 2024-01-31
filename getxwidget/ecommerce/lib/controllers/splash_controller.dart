import 'dart:io';

import 'package:ecommerce/common/components/custom_snack_bar.dart';
import 'package:ecommerce/common/components/full_screen_dialog_loader.dart';
import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/network_controller.dart';
import 'package:ecommerce/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/user_data_model.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  List<User> lstUser = [];
  GetStorage _getStorage = GetStorage();
  // NetworkController networkController = NetworkController();

  //Web 버전 처리용(없으면 에러 발생) 1
  // Future<bool> hasNetwork() async {
  //   try {
  //     final result = await http.get(Uri.parse('www.google.com'));
  //
  //     if(result.statusCode==200){
  //       return true;
  //     }
  //     else{
  //       return false;
  //     }
  //   }
  //   on SocketException catch (_) {
  //     return false;
  //   }
  // }

  @override
  void onInit() {
    super.onInit();

    getUserDetails();
  }

  void getUserDetails() async {
    _getStorage.write(GetStorageKey.stateId, null);
    _getStorage.write(GetStorageKey.cityId, null);
    _getStorage.write(GetStorageKey.areaId, null);
    _getStorage.write(GetStorageKey.selectedAreaPinCode, null);


    // if(kIsWeb){
    //   await hasNetwork();
    // }

    if (await InternetConnectionChecker().hasConnection) {
      print('aaa');
      if (_getStorage.read('userId') != null) {
        try {
          FullScreenDialogLoader.showDialog();
          UserRepository.to
              .getUserDetails(
                  userId: _getStorage.read('userId'),
                  roleId: _getStorage.read('roleId'))
              .then((response) {
            FullScreenDialogLoader.cancelDialog();
            if (response.result == 'success') {
              lstUser.clear();
              lstUser.addAll(response.userData);

              //user is customer
              if (lstUser[0].roleId == 1) {
                //valid customer
                if (lstUser[0].customerStatus == 1) {
                  _getStorage.write(GetStorageKey.userId, lstUser[0].userId);
                  _getStorage.write(GetStorageKey.roleId, lstUser[0].roleId);
                  _getStorage.write(GetStorageKey.customerId, lstUser[0].customerId);
                  _getStorage.write(GetStorageKey.customerFirstName, lstUser[0].customerFirstName);
                  _getStorage.write(GetStorageKey.customerLastName, lstUser[0].customerLastName);
                  _getStorage.write(GetStorageKey.customerProfileImage, lstUser[0].customerProfileImage);
                  _getStorage.write(GetStorageKey.customerEmail, lstUser[0].customerEmail ?? "0");
                  _getStorage.write(GetStorageKey.customerStatus, lstUser[0].customerStatus);
                  _getStorage.write(GetStorageKey.createdOn, lstUser[0].createdOn);
                  _getStorage.write(GetStorageKey.userMobile, lstUser[0].userMobile);

                  if (_getStorage.read('stateId') != null) {
                    if (_getStorage.read('cityId') != null) {
                      if (_getStorage.read('areaId') != null) {
                        Get.offNamed('/home');
                      } else {
                        //redirect the user to Area view
                        // _getStorage.write(GetStorageKey.areaId, 'areaId');
                        Get.offNamed('/area');
                      }
                    } else {
                      //Redirect the user to City view
                      // _getStorage.write(GetStorageKey.cityId, 'cityId');
                      Get.offNamed('/city');
                    }
                  } else {
                    //redirect the user to State view
                    // _getStorage.write(GetStorageKey.stateId, 'stateId');
                    Get.offNamed('/state');
                  }
                } else {
                  CustomSnackBar.showInfoSnackBar(
                      title: AppString.information,
                      message: AppString.statusInactive);
                }
              } else if (lstUser[0].roleId == 2) {
                //roleId=2 (Vendor)
              } else if (lstUser[0].roleId == 3) {
                //roleId=3 (Delivery boy)
              }
            } else if (response.result == 'not found') {
              CustomSnackBar.showErrorSnackBar(
                  title: AppString.error, message: response.message.toString());
              _closeApp();
            }
          }, onError: (err, stackTrace) {
            FullScreenDialogLoader.cancelDialog();

            CustomSnackBar.showErrorSnackBar(
                title: AppString.error, message: AppString.someThingWentWrong);
          });
          _closeApp();
        } catch (e) {
          FullScreenDialogLoader.cancelDialog();
          CustomSnackBar.showErrorSnackBar(
              title: AppString.error, message: AppString.someThingWentWrong);
          _closeApp();
        }
      } else {
        if (_getStorage.read('stateId') != null) {
          if (_getStorage.read('cityId') != null) {
            if (_getStorage.read('areaId') != null) {
              //redirect the user to Home view
              Get.offNamed('/home');
            } else {
              //redirect the user to Area view
              Get.offNamed('/area');
            }
          } else {
            // redirect the user to City view
            Get.offNamed('/city');
          }
        } else {
          // redirect the user to State view;
          Get.offNamed('/state');

        }
      }
    } else {
      CustomSnackBar.showErrorSnackBar(
          title: AppString.networkError,
          message: AppString.connectWithInternet);
      _closeApp();
    }
  }

  //App 종료
  void _closeApp() {
    Future.delayed(Duration(milliseconds: 2000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop', true);
    });
  }
}
