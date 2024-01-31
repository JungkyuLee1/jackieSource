import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InternationalController extends GetxController{

  void changeLanguage(var param1, var parma2){
    var locale = Locale(param1, parma2);

    Get.updateLocale(locale);
  }
}