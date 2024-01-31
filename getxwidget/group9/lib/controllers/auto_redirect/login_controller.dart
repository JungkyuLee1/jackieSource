import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  final storage=GetStorage();

  //Main setting 중요
  // await GetStorage.init();
  
  @override
  void onInit() {
    super.onInit();

  }

  void login(){
    storage.write('id', 1);
    storage.write('name', 'Jackie Lee');
    Get.offAllNamed('/home');
  }


}