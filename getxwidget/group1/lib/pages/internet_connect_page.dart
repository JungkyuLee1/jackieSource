import 'package:feature_collection/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnectPage extends GetView<NetworkController> {
  const InternetConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connectivity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Network is connected by'),
            Obx(() => Text(
                  controller.connectionStatus.value == 1
                      ? "Wi-fi"
                      : controller.connectionStatus.value == 2
                          ? 'Mobile Internet'
                          : 'None',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
