//getx : /flutterprojectnew30/getxwidet/group6-perm 참조

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var password = ''.obs;
  var displayText = ''.obs;
  var passwordStrength = 0.0.obs;
  RegExp numberRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");
  var isPasswordHidden=true.obs;

  void checkPasswordStrength(String value) {
    password.value = value.trim();

    if (password.value.isEmpty) {
      passwordStrength.value = 0.0;
      displayText.value = 'Enter a password';
    } else if (password.value.length < 6) {
      passwordStrength.value = 1 / 4;
      displayText.value = 'Password too short';
    } else if (password.value.length < 8) {
      passwordStrength.value = 2 / 4;
      displayText.value = 'Password not strong';
    } else {
      if (!letterRegExpress.hasMatch(password.value) ||
          !numberRegExpress.hasMatch(password.value)) {
        passwordStrength.value = 3 / 4;
        displayText.value = 'Password strong';
      } else {
        passwordStrength.value = 1;
        displayText.value = 'Password strongest';
      }
      ;
    }
  }
}