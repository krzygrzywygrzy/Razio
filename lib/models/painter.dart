import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    paint.color = Color(0xff652a78);
    canvas.drawPath(path, paint);

    Path purplePath = Path();
    purplePath.lineTo(size.width * 0.4, 0);
    purplePath.quadraticBezierTo(
        size.width * .25, size.height * .3, 0, size.height / 2);
    purplePath.close();
    paint.color = Colors.purple;
    canvas.drawPath(purplePath, paint);

    Path trianglePath = Path();
    trianglePath.lineTo(size.width * 0.25, 0);
    trianglePath.lineTo(0, size.height * 0.2);
    paint.color = Colors.cyan;
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
