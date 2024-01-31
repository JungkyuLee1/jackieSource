import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class CircleRotateAnimateController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController animationController;
  var isAnimating=false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController=AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
  }

  void startAnimation(){
    if(isAnimating.value){
      isAnimating.value=false;
      animationController.stop();
    }else{
      isAnimating.value=true;
      animationController.forward();
      animationController.repeat();
    }
  }
}