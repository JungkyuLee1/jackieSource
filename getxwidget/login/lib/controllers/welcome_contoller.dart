import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login/controllers/auth_controller.dart';

class WelcomeController extends GetxController {
  AuthController authController = Get.find<AuthController>();
  late User user;

  @override
  void onInit() {
    super.onInit();

    user = Get.arguments;
  }

  void logOut() async {
    String loginType = authController.loginType.value;
    if (loginType == 'google') {
      await authController.googleSignIn.disconnect();
      await authController.firebaseAuth.signOut();
    } else if (loginType == 'email') {
      await authController.firebaseAuth.signOut();
    } else if (loginType == 'facebook') {
    } else if (loginType == 'apple') {}
  }
}
