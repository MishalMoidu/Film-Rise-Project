import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color(0xFF3b9d9b)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.cubicTo(
        size.width * 0.0192533,
        size.height * 0.8894000,
        size.width * 0.1691200,
        size.height * 0.7914750,
        size.width * 0.5492800,
        size.height * 0.7863250);
    path0.cubicTo(
        size.width * 0.8718667,
        size.height * 0.7857500,
        size.width * 0.9337600,
        size.height * 0.6719000,
        size.width,
        size.height * 0.6007000);
    path0.quadraticBezierTo(
        size.width * 1.0132533, size.height * 0.4433750, size.width, 0);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(0, size.height * 0.2500000, 0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
