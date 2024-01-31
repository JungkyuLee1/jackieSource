import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/controllers/login_controller.dart';

class EmailLoginController extends GetxController{
  LoginController loginController =Get.find<LoginController>();
  late GlobalKey<FormState> loginKey=GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late String email;
  late String password;
  late AutovalidateMode autoValidateMode;

  @override
  void onInit() {
    super.onInit();

    emailController=TextEditingController();
    passwordController=TextEditingController();
    autoValidateMode=AutovalidateMode.disabled;
  }

  //Email
  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return 'Provide valid email';
    }
    return null;
  }

  //Password
  String? validatePassword(String value){
    if(value.length < 6){
      return 'Password must be of 6 characters';
    }
    return null;
  }

  //Save 처리
  void checkLogin(){
    final isValid = loginKey.currentState!.validate();

    if(!isValid){
      return null;
    }
    autoValidateMode = AutovalidateMode.always;
    loginKey.currentState!.save();
    loginController.unFocus();

    loginController.emailLogin(email, password);
  }




  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}