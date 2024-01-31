import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinePaintPage extends StatelessWidget {
  const LinePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: CustomPaint(
            foregroundPainter: LinePainter(),
            child: Text('Line'),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint=Paint()..strokeWidth=5..color=Colors.orange;

    canvas.drawLine(Offset(size.width*0.2, size.height*0.5), Offset(size.width*0.8, size.height*0.5), paint);
    canvas.drawLine(Offset(size.width*0.3, size.height*0.7), Offset(size.width*0.7, size.height*0.7), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
  }

}
