import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('id : ${controller.id}' ),
            SizedBox(height: 10,),
            Text('name : ${controller.name}' ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              controller.logout();
            }, child: Text('LogOut')),
          ],
        ),
      ),
    );
  }
}
