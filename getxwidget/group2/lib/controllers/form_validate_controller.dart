import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormValidateController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  var email = '';
  var password = '';
  late AutovalidateMode autoValidateMode;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    autoValidateMode = AutovalidateMode.disabled;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Provide valid Email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    autoValidateMode = AutovalidateMode.always;
    loginKey.currentState!.save();
    print('Login successfully');
  }

  void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
