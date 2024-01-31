//getx : /flutterprojectnew30/getxwidet/group6-perm 참조

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group6_withpermission/models/state_model.dart';
import 'package:group6_withpermission/repositories/dropdown_repository.dart';

import '../models/zone_model.dart';

class DropDownController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var lstZone = Rx<List<Zone>>([]);
  var lstState = Rx<List<StateDatum>>([]);

  // var lstState= <StateDatum>[].obs;
  // var lstZone = <Zone>[].obs;
  var selectedZoneId = '0'.obs;
  var selectedStateId = '0'.obs;
  var lstZoneDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);
  var lstStateDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);

  @override
  void onInit() {
    super.onInit();
    getZone();
  }

  void getZone() {
    try {
      // Get.dialog(Center(child: CircularProgressIndicator(),));

      DropDownRepository.to.getZone().then((value) {
        if (value.zoneData.length > 0) {
          // Get.back();

          lstZone.value.clear();
          lstZone.value.addAll(value.zoneData);

          selectedZoneId.value = '0';
          lstZoneDropDownMenuItem.value = [];
          lstZoneDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Zone',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: '0',
            ),
          );

          for (Zone zone in lstZone.value) {
            lstZoneDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  zone.zoneName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: zone.zoneId.toString(),
              ),
            );
          }
        }
      }, onError: (err) {
        Get.back();
      });
    } catch (e) {
      Get.back();
    }
  }

  //State 가져오기
  void getState(String zoneId) {
    try {
      DropDownRepository.to.getState(zoneId).then((value) {
        if (value.stateData.length > 0) {
          lstState.value.clear();
          lstState.value.addAll(value.stateData);

          selectedStateId.value = '0';
          lstStateDropDownMenuItem.value = [];
          lstStateDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select State',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: '0',
            ),
          );

          for (StateDatum stateDatum in lstState.value) {
            lstStateDropDownMenuItem.value.add(DropdownMenuItem(
              child: Text(
                stateDatum.stateName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              value: stateDatum.stateId.toString(),
            ));
          }
        }
      }, onError: (err) {
        Get.back();
      });
    } catch (e) {
      Get.back();
    }
  }

  String? validateZone(String value) {
    if (value == '0') {
      return 'Select Zone';
    }
    return null;
  }

  String? validateState(String value) {
    if (value == '0') {
      return 'Select State';
    }
    return null;
  }
}
