import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group9/controllers/confetti_effect_controller.dart';

class ConfettiEffectPage extends GetView<ConfettiEffectController> {
  const ConfettiEffectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Confetti Effect'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                controller.startConfettiAnimation();
              },
              child: Obx(
                  () => Text(controller.isPlaying.value ? 'Stop' : 'Start')),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller.confettiController,
          shouldLoop: true,
          // blastDirectionality: BlastDirectionality.explosive,
          // blastDirection: 0, //right
          // blastDirection: pi, //left(default)
          // blastDirection: pi/2, //down
          blastDirection: -pi/2, //up
          // emissionFrequency: 0.8,
          numberOfParticles: 5,
          // gravity: 0.8,
          colors: [Colors.red, Colors.yellow, Colors.green],
          // createParticlePath: (size){
          //   var path=Path();
          //   path.addOval(Rect.fromCircle(center: Offset.zero, radius: 40));
          //   return path;
          // },
        )

      ],
    );

    //   Scaffold(
    //   appBar: AppBar(
    //     title: Text('Confetti Effect'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(onPressed: (){}, child: Text('Start'),),
    //   ),
    // );
  }
}
