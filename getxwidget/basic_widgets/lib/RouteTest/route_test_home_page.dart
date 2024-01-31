import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteTestHomePage extends StatelessWidget {
  const RouteTestHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'This is Home Screen.\n'
                'args : ${Get.arguments}\n'
                'Parameters : ${Get.parameters['channel']} & ${Get.parameters['content']}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.deepOrange),
              ),
            ),
            ElevatedButton(onPressed: () {
              Get.toNamed('/next/1234');
            }, child: Text('Next Screen')),
            ElevatedButton(
                onPressed: () {
                  // Get.back();
                  Get.back(result: 'rslt from home');
                },
                child: Text('Back to Main')),
          ],
        ),
      ),
    );
  }
}
