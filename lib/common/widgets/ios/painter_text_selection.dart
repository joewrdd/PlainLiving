import 'package:flutter/material.dart';

class CustomTextSelectionHandlePainter extends CustomPainter {
  final Color color;

  CustomTextSelectionHandlePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double radius = size.width / 2;
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(CustomTextSelectionHandlePainter oldPainter) {
    return color != oldPainter.color;
  }
}
