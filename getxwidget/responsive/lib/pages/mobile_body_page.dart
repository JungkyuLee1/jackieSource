import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_layout/controllers/home_controller.dart';

class MobileBodyPage extends StatelessWidget {
  MobileBodyPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile : ${homeController.deviceType.value}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 300,
              color: Colors.deepPurple[400],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      color: Colors.grey,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
