import 'package:flutter/material.dart';

class ArcPaintPage extends StatelessWidget {
  const ArcPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: CustomPaint(
            foregroundPainter: ArcPainter(),
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    //eyebrow, mouth
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.2);
    path.arcToPoint(
      Offset(size.width * 0.4, size.height * 0.2),
      radius: Radius.circular(20),
      clockwise: true,
    );

    path.moveTo(size.width*0.6, size.height*0.2);
    path.arcToPoint(Offset(size.width*0.7, size.height*0.2),
      radius: Radius.circular(20),
      clockwise: true
    );

    path.moveTo(size.width*0.4, size.height*0.6);
    path.arcToPoint(Offset(size.width*0.6, size.height*0.6),
      radius: Radius.circular(50),
      clockwise: false
    );

    //eyeball
    final eyePaint=Paint()..strokeWidth=5..color=Colors.red;
    canvas.drawCircle(Offset(size.width*0.35, size.height*0.25), size.width*0.03, eyePaint);
    canvas.drawCircle(Offset(size.width*0.65, size.height*0.25), size.width*0.03, eyePaint);
    
    //Nose
    path.moveTo(size.width*0.5, size.height*0.37);
    path.lineTo(size.width*0.45, size.height*0.45);
    path.lineTo(size.width*0.55, size.height*0.45);
    path.lineTo(size.width*0.5, size.height*0.37);
    canvas.drawPath(path, paint);
 
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // throw UnimplementedError();
  }
}
