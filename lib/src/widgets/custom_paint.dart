import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0XFF3A437D)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.420000076293945;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.00, size.height * 0.00);
    path_0.lineTo(size.width * 1.00, size.height * 0.00);
    path_0.lineTo(size.width * 1.00, size.height * 0.83);
    path_0.quadraticBezierTo(size.width * 0.85, size.height * 0.98,
        size.width * 0.65, size.height * 0.97);
    path_0.cubicTo(size.width * 0.50, size.height * 0.97, size.width * 0.39,
        size.height * 0.86, size.width * 0.23, size.height * 0.85);
    path_0.quadraticBezierTo(size.width * 0.11, size.height * 0.84,
        size.width * -0.00, size.height * 0.98);
    path_0.lineTo(size.width * -0.00, size.height * 0.00);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
