import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group5/controllers/image_paint_controller.dart';
import 'dart:ui' as ui;

class ImagePaintPage extends GetView<ImagePaintController> {
  const ImagePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
          child: !controller.isLoading.value
              ? CircularProgressIndicator()
              : Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.image!.width.toDouble(),
                      height: controller.image!.height.toDouble(),
                      child: CustomPaint(
                        painter: ImagePainter(controller.image!),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  ImagePainter(this.image);

  final ui.Image image;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.red;

    canvas.drawImage(image, Offset.zero, paint);
    // canvas.drawImage(image, Offset(size.width * 0.15, size.height * 0.15), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;

    // throw UnimplementedError();
  }
}
