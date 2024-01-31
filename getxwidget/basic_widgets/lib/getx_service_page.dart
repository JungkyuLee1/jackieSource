import 'package:basic_widget/controller/async_controller.dart';
import 'package:basic_widget/controller/getx_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxServicePage extends StatelessWidget {
  GetxServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetxService'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.find<GetXServiceController>().incrementCount();
            // controller.incrementCount();
          },
          child: Text('Increment by GetxService'),
        ),
      ),
    );
  }
}
