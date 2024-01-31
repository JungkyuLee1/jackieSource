import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              controller.login();
            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
