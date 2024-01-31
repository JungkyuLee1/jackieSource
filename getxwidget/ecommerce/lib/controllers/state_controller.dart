import 'package:ecommerce/common/components/custom_snack_bar.dart';
import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:ecommerce/common/values/app_color.dart';
import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/network_controller.dart';
import 'package:ecommerce/pages/city_page.dart';
import 'package:ecommerce/repositories/state_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/state_data_model.dart';

class StateController extends GetxController {
  final GetStorage _getStorage = GetStorage();

  // List<StateD> lstState = [];
  var lstState = List<StateD>.empty(growable: true).obs;
  StateD? stateModel;
  var selectedIndex = (0 - 1).obs;
  late int selectedStateId;
  int totalPage = 50;
  int page = 0;
  int countPerPage = 10;
  ScrollController scrollController = ScrollController();
  NetworkController networkController = Get.find<NetworkController>();

  @override
  void onInit() {
    super.onInit();
    selectedStateId = _getStorage.read(GetStorageKey.stateId) ?? 0;
    // Get.reset();
  }

  @override
  void onReady() {
    super.onReady();
    getState(countPerPage: countPerPage, pageNo: page);
    paginateState();
  }

  void paginateState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        if (page <= totalPage) {
          page += 10;
          getMoreState();
        }
      }
    });
  }

  //State 가져오기
  getState({required int countPerPage, required int pageNo}) async {
    try {
      StateRepository.to
          .getState(countPerPage: countPerPage, pageNo: pageNo)
          .then((resp) {
        if (resp.result == 'success') {
          if (resp.state.length > 0) {
            // totalPage;
            lstState.clear();
            lstState.addAll(resp.state);
          } else {
            Fluttertoast.showToast(
                msg: AppString.noMoreItems,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: AppColor.whiteColor,
                fontSize: 16);
          }
        } else if (resp.result == 'not found') {
          Fluttertoast.showToast(
              msg: AppString.noMoreItems,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              textColor: AppColor.whiteColor,
              fontSize: 16);

          // CustomSnackBar.showErrorSnackBar(
          //     title: AppString.error, message: resp.message);
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

  //Pagination에서 호출
  getMoreState() {
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

      StateRepository.to
          .getState(countPerPage: countPerPage, pageNo: page)
          .then((resp) {
        Get.back();

        if (resp.result == 'success') {
          if (resp.state.length > 0) {
            lstState.addAll(resp.state);
          } else {
            Fluttertoast.showToast(
                msg: AppString.noMoreItems,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: AppColor.whiteColor,
                fontSize: 16);
          }
        } else if (resp.result == 'not found') {
          Fluttertoast.showToast(
              msg: AppString.noMoreItems,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              textColor: AppColor.whiteColor,
              fontSize: 16);

          // CustomSnackBar.showErrorSnackBar(
          //     title: AppString.error, message: resp.message);
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

  //State 정보 local에 저장(stateId)
  saveSelectedState() async {
    if (stateModel != null) {
      selectedStateId = stateModel!.stateId;
      _getStorage.write(GetStorageKey.stateId, selectedStateId);
      _getStorage.write(GetStorageKey.stateName, stateModel!.stateName);

      //check표시 정확 목적
      lstState.refresh();
      await Get.toNamed('/city');

      // final result = await Get.toNamed('/city');
      // if(result !=null && result==true){
      //   print('result : $result');
      //   // selectedStateId = 2;
      //   lstState.refresh();
      //   paginateState();
      //
      // }
    } else {
      CustomSnackBar.showErrorSnackBar(
          title: AppString.error, message: AppString.selectState);
    }
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
