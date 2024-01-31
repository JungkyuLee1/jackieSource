import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scratcher/scratcher.dart';

class ScratcherController extends GetxController{
  var scratchProgress=0.0.obs;
  var isThresholdReached=false.obs;
  GlobalKey<ScratcherState> scratcherKey=GlobalKey<ScratcherState>();

  void reset(){
    scratcherKey.currentState?.reset(duration: Duration(milliseconds: 2000));
    isThresholdReached(false);
    scratchProgress(0.0);
  }
}

