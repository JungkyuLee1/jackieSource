import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: IntrinsicWidth(
            child: GestureDetector(
              onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/apiCall');
                      },
                      child: Text('Api Call')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/emailStorage');
                      },
                      child: Text('Email Val& Storage')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/getConnectStateMixin');
                      },
                      child: Text('getConnectStateMixin')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/routeTestMain');
                  //     },
                  //     child: Text('Route Test')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/reactive');
                  //     },
                  //     child: Text('State Mgmt(Reactive)')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/simple');
                  //     },
                  //     child: Text('Simple Mgmt(Reactive)')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/worker');
                  //     },
                  //     child: Text('Workers')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/international');
                  //     },
                  //     child: Text('International')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed('/putAsync');
                  //     },
                  //     child: Text('Get.putAsync')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.to(GetxServicePage());
                  //     },
                  //     child: Text('GetxService(Mem상주)')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
