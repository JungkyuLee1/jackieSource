import 'package:basic_widget/controller/async_controller.dart';
import 'package:flutter/material.dart';

class PutAsyncPage extends StatelessWidget {
  PutAsyncPage({Key? key}) : super(key: key);

  AsyncController controller = AsyncController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get.putAsync'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.incrementCount();
          },
          child: Text('Increment'),
        ),
      ),
    );
  }
}
