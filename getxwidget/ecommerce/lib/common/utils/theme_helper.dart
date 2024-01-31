import 'package:ecommerce/common/utils/get_storage_key.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeHelper{
  GetStorage _getStorage = GetStorage();

  bool loadTheme() => _getStorage.read(GetStorageKey.isDarkMode) ?? false;
  ThemeMode get theme=> loadTheme() ? ThemeMode.dark : ThemeMode.light;


  //ThemeMode 저장
  saveTheme(bool isDarkMode){
    _getStorage.write(GetStorageKey.isDarkMode, isDarkMode);
  }

  //ThemeMode 전환
  switchTheme(){
    Get.changeThemeMode(loadTheme() ? ThemeMode.light : ThemeMode.dark);
    saveTheme(!loadTheme());
  }


}