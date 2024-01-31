import 'package:flutter/material.dart';

class RectanglePaintPage extends StatelessWidget {
  const RectanglePaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: CustomPaint(
            foregroundPainter: RectAnglePainter(),
            child: Text('Rectangle'),
          ),
        ),
      ),
    );
  }
}

class RectAnglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.purple
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromPoints(Offset(size.width * 0.3, size.height * 0.2),
        Offset(size.width * 0.7, size.height * 0.4));

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
}
