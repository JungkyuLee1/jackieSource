import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
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
                        Get.toNamed('/loadingBtnIndicator');
                      },
                      child: Text('Loading Button Indicator')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/flipCard');
                      },
                      child: Text('FlipCard')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/shakePhone');
                      },
                      child: Text('Shake Phone to change color')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/multiSelectDialog');
                      },
                      child: Text('Multi Select Dialog')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/multiSelectDropDown');
                      },
                      child: Text('Multi Select DropDown')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/fabCircular');
                      },
                      child: Text('Fab Circular(Floating)')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/shrinkSideMenu');
                      },
                      child: Text('Shrink Side Menu')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/panoramaImage');
                      },
                      child: Text('Panorama Image')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/reviewsSlider');
                      },
                      child: Text('Reviews Slider')),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/ratingDialog');
                      },
                      child: Text('Rating Dialog')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
