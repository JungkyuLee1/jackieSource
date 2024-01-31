import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  final storage=GetStorage();
  var id,name;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  void getUserInfo(){
    id=storage.read('id');
    name=storage.read('name');
  }


  void logout(){
    storage.erase();
    Get.offAllNamed('/login');
  }



}