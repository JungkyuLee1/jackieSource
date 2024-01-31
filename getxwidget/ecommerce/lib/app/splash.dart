import 'package:ecommerce/common/values/app_string.dart';
import 'package:ecommerce/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/sellon-logo.png',
              fit: BoxFit.cover,
              width: Get.width * 0.6,
              height: 60,
            ),
            SizedBox(height: 10,),
            Text(
              AppString.appName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
