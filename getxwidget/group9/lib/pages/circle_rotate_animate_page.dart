import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/circle_rotate_animate_controller.dart';

class CircleRotateAnimatePage extends GetView<CircleRotateAnimateController> {
  const CircleRotateAnimatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Rotation Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0)
                  .animate(controller.animationController),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    border: Border.all(width: 2, color: Colors.blue)),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/no-internet.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.startAnimation();
                },
                child: Obx(() =>
                    Text(controller.isAnimating.value ? 'Stop' : 'Start')))
          ],
        ),
      ),
    );
  }
}
