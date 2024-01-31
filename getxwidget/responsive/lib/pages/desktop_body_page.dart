import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_layout/controllers/home_controller.dart';

class DesktopBodyPage extends StatelessWidget {
  DesktopBodyPage({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile : ${homeController.deviceType.value}'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 300,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              color: Colors.grey,
                            ),
                          );
                        }))
              ],
            ),
          ),
          Container(
            width: 300,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      color: Colors.green,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
