import 'package:ecommerce/common/utils/theme_helper.dart';
import 'package:get/get.dart';

class MyAccountController extends GetxController{
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value=ThemeHelper().loadTheme();
  }

  changeTheme(){
    isDarkMode.value = !isDarkMode.value;
    ThemeHelper().switchTheme();
  }
}