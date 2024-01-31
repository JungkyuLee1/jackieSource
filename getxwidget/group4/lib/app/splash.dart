import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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
                      Get.toNamed('/reorderable');
                    },
                    child: Text('ReOrderAble on List')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/permission');
                    },
                    child: Text('Permission Handler')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/methodChannel');
                    },
                    child: Text('Call Method Channel-Java')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/callJavascript');
                    },
                    child: Text('Javascript-Web')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/keyboardHide');
                    },
                    child: Text('Keyboard Hide')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/qrCode');
                    },
                    child: Text('QR Code Creation')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/customLoader');
                    },
                    child: Text('Custom Loader(StateMixin)')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
