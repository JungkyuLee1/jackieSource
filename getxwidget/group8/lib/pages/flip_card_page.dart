import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/flip_card_controller.dart';

class FlipCardPage extends GetView<FlipCardHandleController> {
  const FlipCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlipCard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
              controller: controller.flipCardController,
              flipOnTouch: false,
              front: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'GetX',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              back: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                decoration: BoxDecoration(color: Colors.yellow),
                child: Text(
                  'Card',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              controller.flipCardController.toggleCard();
            }, child: Text('Toggle'))
          ],
        ),
      ),
    );
  }
}
