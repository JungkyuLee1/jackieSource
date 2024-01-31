import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ShrinkSideMenuController extends GetxController {
  GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  void openCloseSideMenu() {
    if (sideMenuKey.currentState!.isOpened) {
      sideMenuKey.currentState!.closeSideMenu();
    } else {
      sideMenuKey.currentState!.openSideMenu();
    }
  }
}
