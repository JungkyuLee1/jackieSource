import 'package:ecommerce/common/components/custom_snack_bar.dart';
import 'package:ecommerce/common/components/empty_failure_nointernet.dart';
import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/network_controller.dart';
import 'package:ecommerce/repositories/area_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/area_data_model.dart';

class AreaController extends GetxController {
  GetStorage _getStorage = GetStorage();
  ScrollController scrollController = ScrollController();
  NetworkController networkController = Get.find<NetworkController>();
  var lstArea = List<Area>.empty(growable: true).obs;
  var isSelectedIndex = (0 - 1).obs;
  late int selectedAreaId;
  late int selectedCityId;
  late String selectedAreaPinCode;
  Area? areaModel;
  int countPerPage = 10;
  int page = 0;
  int totalPage = 1;

  @override
  void onInit() {
    super.onInit();
    selectedAreaId = _getStorage.read(GetStorageKey.areaId) ?? 0;
    selectedCityId = _getStorage.read(GetStorageKey.cityId);
    selectedAreaPinCode =
        _getStorage.read(GetStorageKey.selectedAreaPinCode) ?? "";
  }

  @override
  void onReady() {
    super.onReady();
    getArea();
    paginateArea();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //Area 최초 조회
  void getArea() async {
    try {
      AreaRepository.to
          .getArea(
              cityId: selectedCityId, countPerPage: countPerPage, pageNo: page)
          .then((resp) {
        if (resp.result == 'success') {
          if (resp.areaData.areas.length > 0) {
            lstArea.clear();
            lstArea.addAll(resp.areaData.areas);
          } else {
            Fluttertoast.showToast(
                msg: AppString.noMoreItems,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: AppColor.whiteColor,
                fontSize: 16);
          }
        } else if (resp.result == 'not found') {
          //AreaPage() : Error Page
        }
      }, onError: (err) {
        CustomSnackBar.showErrorSnackBar(
            title: AppString.error, message: AppString.someThingWentWrong);
      });
    } catch (e) {
      CustomSnackBar.showErrorSnackBar(
          title: AppString.error, message: AppString.someThingWentWrong);
    }
  }

  void paginateArea() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (page <= totalPage) {
          page += 10;
          getMoreArea();
        }
      }
    });
  }

  //Area 추가 조회
  void getMoreArea() async {
    try {
      Get.dialog(Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpinKitThreeBounce(
            size: 20,
            color: Get.isDarkMode
                ? AppColor.yellowColor
                : AppColor.deepPurpleAccentColor,
          )
        ],
      ));

      AreaRepository.to
          .getArea(
              cityId: selectedCityId, countPerPage: countPerPage, pageNo: page)
          .then((resp) {
        Get.back();
        if (resp.result == 'success') {
          if (resp.areaData.areas.length > 0) {
            //total
            lstArea.addAll(resp.areaData.areas);
          } else {
            CustomSnackBar.showErrorSnackBar(
                title: AppString.error, message: AppString.noMoreItems);
          }
        } else if (resp.result == 'not found') {
          //AreaPage() : Error Page

          // CustomSnackBar.showErrorSnackBar(
          //     title: AppString.error, message: AppString.noMoreItems);
        }
      }, onError: (err) {
        CustomSnackBar.showErrorSnackBar(
            title: AppString.error, message: AppString.someThingWentWrong);
      });
    } catch (e) {
      Get.back();
      CustomSnackBar.showErrorSnackBar(
          title: AppString.error, message: AppString.someThingWentWrong);
    }
  }

  //Area id 저장
  saveSelectedArea() {
    if (areaModel != null) {
      selectedAreaId = areaModel!.areaId;
      selectedAreaPinCode = areaModel!.areaPinCode;
      _getStorage.write(GetStorageKey.areaId, selectedAreaId);
      _getStorage.write(GetStorageKey.areaName, areaModel!.areaName);
      _getStorage.write(GetStorageKey.selectedAreaPinCode, selectedAreaPinCode);

      //check표시 정확 목적
      lstArea.refresh();
      Get.toNamed('/home');
    } else {
      CustomSnackBar.showErrorSnackBar(
          title: AppString.error, message: AppString.selectArea);
    }
  }
}
