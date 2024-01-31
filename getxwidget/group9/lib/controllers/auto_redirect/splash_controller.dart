import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  //Main setting 중요
  // await GetStorage.init();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    print('aaa');
    loginCheck();
  }

  void loginCheck() {
    if (storage.read('id') != null) {
      Future.delayed(Duration(milliseconds: 2000))
          .then((_) => Get.offAllNamed('/home'));
    } else {
      Get.offAllNamed('/login');
    }
  }
}
