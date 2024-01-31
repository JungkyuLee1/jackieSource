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
                      Get.toNamed('/textExtract');
                    },
                    child: Text('Text Extract from Image(1)')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/barCode');
                    },
                    child: Text('Barcode from Image(2)')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/labeling');
                    },
                    child: Text('Image Labeling(3)')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/scanBarcode');
                    },
                    child: Text('Scan Barcode/QR')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
