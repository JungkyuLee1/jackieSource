import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login/components/message_popup.dart';
import 'package:login/repositories/login_repository.dart';

import '../common/custom_full_screen_dialog.dart';
import '../common/widgets.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  void googleLogin() async {
    CustomFullScreenDialog.showDialog();

    try {
      await LoginRepository.googleLogin();
    } catch (e) {
      rethrow;
    }
  }

  //email login
  void emailLogin(String email, String password) async {
    CustomFullScreenDialog.showDialog();

    try {
      await LoginRepository.emailLogin(email, password);
    } on PlatformException catch (e) {
      CustomFullScreenDialog.cancelDialog();

      Widgets.showSnackBar(
          'Login Failed', e.toString(), Colors.white, Colors.red);
    } catch (e) {
      CustomFullScreenDialog.cancelDialog();

      Get.dialog(MessagePopup(
        'User not found',
        'Do you want to signup with this account?',
        cancelCallback: Get.back,
        okCallback: () async {
          await LoginRepository.emailSignup(email, password);
        },
      ));
    }
  }

  //email signup
  void emailSignup(String email, String password) async {
    try {
      await LoginRepository.emailSignup(email, password);
    } on PlatformException catch (e) {
      CustomFullScreenDialog.cancelDialog();

      Widgets.showSnackBar(
          'Signup failed', e.toString(), Colors.white, Colors.red);
    } catch (e) {
      CustomFullScreenDialog.cancelDialog();

      if (e == 'account exist') {
        await LoginRepository.emailLogin(email, password);
      }
    }
  }

  void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
