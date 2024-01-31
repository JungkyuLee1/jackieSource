import 'package:get/get.dart';

class LoadingBtnIndicatorController extends GetxController{
  var isLoading=false.obs;

  void uploadFile() async{
    isLoading.value=true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value=false;
  }
}