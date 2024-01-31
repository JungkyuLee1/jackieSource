import 'package:flutter/material.dart';

class TrianglePaintPage extends StatelessWidget {
  const TrianglePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(
            painter: TrianglePainter(),
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth=5..color=Colors.green..style=PaintingStyle.stroke;

    final path=Path();
    path.moveTo(size.width*0.5, size.height*0.2);
    path.lineTo(size.width*0.1, size.height*0.7);
    path.lineTo(size.width*0.9, size.height*0.7);
    path.lineTo(size.width*0.5, size.height*0.2);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }

}

