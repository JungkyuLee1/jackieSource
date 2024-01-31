import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/rating_dialog_controller.dart';

class RatingDialogPage extends GetView<RatingDialogController> {
  const RatingDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Dialog'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                ()=> Text(
                  'Your Rating : ${controller.rating.value}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Obx(
                ()=> Text(
                  'Your Comment : ${controller.comments.value}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                controller.showRatingDialog();
              }, child: Text('Rating Dialog'))
            ],
          ),
        ),
      ),
    );
  }
}
