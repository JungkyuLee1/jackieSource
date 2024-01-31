import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/internetConnect');
                    },
                    child: Text('Internet Connection Check')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/imagePicker');
                    },
                    child: Text('ImagePicker')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/multiImage');
                    },
                    child: Text('Multi Image Selection')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/bioAuth');
                    },
                    child: Text('Finger&Face Recognition'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
