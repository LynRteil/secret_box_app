import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0) 
      ..lineTo(size.width, 0) 
      ..lineTo(size.width / 2, size.height) 
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) => false;
}
