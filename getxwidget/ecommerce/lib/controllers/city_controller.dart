import 'package:ecommerce/common/components/custom_snack_bar.dart';
import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/network_controller.dart';
import 'package:ecommerce/pages/city_page.dart';
import 'package:ecommerce/repositories/city_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/city_data_model.dart';

class CityController extends GetxController {
  GetStorage _getStorage = GetStorage();
  var lstCity = List<City>.empty(growable: true).obs;
  City? cityModel;
  late int selectedCityId;
  late int selectedStateId;
  var selectedIndex = (0 - 1).obs;
  int countPerPage = 10;
  int page = 0;
  int totalPage = 1;

  ScrollController scrollController = ScrollController();
  NetworkController networkController = Get.find<NetworkController>();

  @override
  void onInit() {
    super.onInit();
    selectedStateId = _getStorage.read(GetStorageKey.stateId);
    selectedCityId = _getStorage.read(GetStorageKey.cityId) ?? 0;

  }

  @override
  void onReady() {
    // TODO: implement onReady
    // selectedStateId = _getStorage.read(GetStorageKey.stateId);
    // selectedCityId = _getStorage.read(GetStorageKey.cityId) ?? 0;
    super.onReady();
    getCity();
    paginateCity();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //City 정보조회(최초)
  void getCity() async {
    try {
      CityRepository.to
          .getCity(
              stateId: selectedStateId,
              countPerPage: countPerPage,
              pageNo: page)
          .then((resp) {
        if (resp.result == 'success') {
          if (resp.cityData.cities.length > 0) {
            //totalPage
            lstCity.clear();
            lstCity.addAll(resp.cityData.cities);
          } else {
            Fluttertoast.showToast(
              msg: AppString.noMoreItems,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              textColor: AppColor.whiteColor,
              fontSize: 16,
            );
          }
        } else if (resp.result == 'not found') {
          // CityPage() : EmptyFailureNoInternet()

          // Fluttertoast.showToast(
          //     msg: AppString.noMoreItems,
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     textColor: AppColor.whiteColor,
          //     fontSize: 16);
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

  //Pagination
  void paginateCity() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (page <= totalPage) {
          page += 10;
          getMoreCity();
        }
      }
    });
  }

  //get more city 정보
  void getMoreCity() {
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

      CityRepository.to
          .getCity(
              stateId: selectedStateId,
              countPerPage: countPerPage,
              pageNo: page)
          .then((resp) {
        Get.back();
        if (resp.result == 'success') {
          if (resp.cityData.cities.length > 0) {
            //total
            lstCity.addAll(resp.cityData.cities);
          } else {
            Fluttertoast.showToast(
                msg: AppString.noMoreItems,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: AppColor.whiteColor,
                fontSize: 16);
          }
        } else if (resp.result == 'not found') {
          // CityPage() : EmptyFailureNoInternet()
          // Fluttertoast.showToast(
          //     msg: AppString.noMoreItems,
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     textColor: AppColor.whiteColor,
          //     fontSize: 16);
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

  //City 정보 local에 저(cityId)
  void saveSelectedCity() async{
    if (cityModel != null) {
      selectedCityId = cityModel!.cityId;
      _getStorage.write(GetStorageKey.cityId, selectedCityId);
      _getStorage.write(GetStorageKey.cityName, cityModel!.cityName);

      //check표시 정확 목적
      lstCity.refresh();
      await Get.toNamed('/area');
    } else {
      CustomSnackBar.showErrorSnackBar(
          title: AppString.error, message: AppString.selectCity);
    }
  }
}
