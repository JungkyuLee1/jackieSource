import 'package:flutter/material.dart';

class RoundedRectanglePage extends StatelessWidget {
  const RoundedRectanglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: CustomPaint(
            foregroundPainter: RoundedRectangelPainter(),
            child: Text('RoundedRectangle'),
          ),
        ),
      ),
    );
  }
}

class RoundedRectangelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.yellowAccent
      ..style = PaintingStyle.stroke;

    final a = Offset(size.width * 0.1, size.height * 0.1);
    final b = Offset(size.width * 0.7, size.height * 0.7);
    final rect = Rect.fromPoints(a, b);
    final radius = Radius.circular(20);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
}
