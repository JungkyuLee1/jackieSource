import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/email_login_controller.dart';
import 'package:login/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  EmailLoginController emailLoginController = Get.find<EmailLoginController>();

  //email login
  _emailLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            controller: emailLoginController.emailController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 1),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.white)
            ),
            validator: (val) {
              return emailLoginController.validateEmail(val!);
            },
            onSaved: (val) {
              emailLoginController.email=val!;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: emailLoginController.passwordController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 1),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.white)
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (val) {
              return emailLoginController.validatePassword(val!);
            },
            onSaved: (val) {
              emailLoginController.password=val!;;
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              emailLoginController.checkLogin();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

//SNS 버튼 공통
  _socialMediaButton(
      {required String title,
      required Color backgroundColor,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: backgroundColor),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }

  //Social Media Login
  _socialMedia() {
    return Column(
      children: [
        _socialMediaButton(
            title: 'Google',
            backgroundColor: Colors.red,
            onTap: () => controller.googleLogin()),
        _socialMediaButton(
            title: 'Facebook', backgroundColor: Colors.blue, onTap: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
          controller.unFocus(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: emailLoginController.loginKey,
                autovalidateMode: emailLoginController.autoValidateMode,
                child: Column(
                  children: [
                    _emailLogin(),
                    SizedBox(height: 80,),
                    _socialMedia(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
