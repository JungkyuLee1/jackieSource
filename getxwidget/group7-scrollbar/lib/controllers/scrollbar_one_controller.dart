import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScrollbarOneController extends GetxController{
    late ScrollController scrollController;

    @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }


  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}