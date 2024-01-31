import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group8/controllers/loading_btn_indicator_controller.dart';

class LoadingBtnIndicatorPage extends GetView<LoadingBtnIndicatorController> {
  const LoadingBtnIndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Button with Indicator'),
      ),
      body: Center(
        child: Container(
          width: 150,
          child: Obx(
            () => ElevatedButton(
              onPressed: controller.isLoading.value ? null : () {
                controller.uploadFile();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  controller.isLoading.value
                      ? Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Icon(Icons.upload_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Upload'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
