import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/auto_redirect/splash_controller.dart';

class Splash extends GetView<SplashController> {
// class Splash extends StatelessWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/confetti');
                      },
                      child: Text('Confetti Effect')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/appUpdateChecker');
                      },
                      child: Text('App Update Checker')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/draggableExpandable');
                      },
                      child: Text('Draggable Expandable Fab')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/videoTrimmer');
                      },
                      child: Text('Video Trimmer')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/multiImage');
                      },
                      child: Text('Multi Image Selection')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/smsCode');
                      },
                      child: Text('SMS Code Read')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/dynamicItems');
                      },
                      child: Text('Dynamic Items to ListView')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/likeButton');
                      },
                      child: Text('Like Button')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/rotatingAnimation');
                      },
                      child: Text('Circle Rotating Animation')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/selectMultiLines');
                      },
                      child: Text('Select Multi Lines in ListView')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
