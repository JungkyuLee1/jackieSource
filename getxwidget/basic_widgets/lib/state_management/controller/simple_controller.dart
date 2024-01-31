import 'package:get/get.dart';

class SimpleController extends GetxController{
  var count=0;

  void increment() async{
    await Future.delayed(Duration(seconds: 2));

    count++;
    // update();
    update(['txtCount']);
  }

  // void cleanUpTask(){
  //   print('Task cleaned up!!');
  // }

  @override
  void onInit() {
    super.onInit();

    increment();
    print('SimpleController initialized');
  }

  @override
  void onClose() {
    super.onClose();
    print('Task cleaned up!!');
  }

}