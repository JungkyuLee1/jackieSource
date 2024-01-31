import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/reviews_slider_controller.dart';
import 'package:reviews_slider/reviews_slider.dart';

class ReviewsSliderPage extends GetView<ReviewsSliderController> {
  const ReviewsSliderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews Slider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How is the GetX tutorial on Rippples Code Channel ?',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              ReviewSlider(
                onChange: (value) {
                  controller.selectedValue.value = value;
                },
                initialValue: 2,
                optionStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepPurple),
                options: ['Terrible', 'Bad', 'Okay', 'Good', 'Great'],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  controller.selectedValue.value == 0
                      ? 'Terrible'
                      : controller.selectedValue.value == 1
                          ? 'Bad'
                          : controller.selectedValue.value == 2
                              ? 'Okay'
                              : controller.selectedValue.value == 3
                                  ? 'Good'
                                  : 'Great',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
