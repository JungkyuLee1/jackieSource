import 'package:basic_widget/controller/international_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternationalPage extends GetView<InternationalController> {
  const InternationalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('International'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'hello'.tr,
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.changeLanguage('ko', 'KO');
                },
                child: Text('Korean')),
            ElevatedButton(
                onPressed: () {
                  controller.changeLanguage('fr', 'FR');
                },
                child: Text('French')),
            ElevatedButton(
                onPressed: () {
                  controller.changeLanguage('en', 'US');
                },
                child: Text('English')),
          ],
        ),
      ),
    );
  }
}
