import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FabCircularController extends GetxController{
  GlobalKey<FabCircularMenuPlusState> fabKey=GlobalKey();


  openCloseFabMenu(){
    if(fabKey.currentState!.isOpen){
      fabKey.currentState!.close();
    }else{
      fabKey.currentState!.open();
    }
  }
}