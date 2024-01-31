import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScrollContController extends GetxController {
  late ScrollController scrollController;
  var scrollMessage = ''.obs;
  var scrollNotificationMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    scrollControllerListener();
  }

  //Listener
  scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMessage.value = 'Reached at Bottom';
      }

      if (scrollController.offset <=
          scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMessage.value = 'Reached at top';
      }
    });
  }

  void scrollUp() {
    scrollController.animateTo(scrollController.offset - 50,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
    //option
    // scrollController.jumpTo(scrollController.offset -50);
  }

  void scrollDown() {
    scrollController.animateTo(
        scrollController.offset + 50, duration: Duration(milliseconds: 500),
        curve: Curves.linear);
    //option
    // scrollController.jumpTo(scrollController.offset +50);
  }

  void startScroll(){
    scrollNotificationMessage.value='Started';
  }

  void updateScroll(){
    scrollNotificationMessage.value='Updated';
  }

  void endScroll(){
    scrollNotificationMessage.value='ended';
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
