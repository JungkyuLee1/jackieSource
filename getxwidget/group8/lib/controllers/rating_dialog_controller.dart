import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter/material.dart';

class RatingDialogController extends GetxController {
  var rating = '3.0'.obs;
  var comments = 'good'.obs;

  void showRatingDialog() {
    Get.dialog(RatingDialog(
        title: Text('Rating Dialog'),
        message: Text(
            'Tap a star to set your rating. Add more description here if you want'),
        image: Image.asset(
          'images/login.png',
          height: 100,
        ),
        submitButtonText: 'Submit',
        onCancelled: () {
          print('canceled!');
        },
        onSubmitted: (response) {
          rating.value = response.rating.toString();
          comments.value = response.comment;
        }));
  }
}
