import 'package:flutter/material.dart';

class DottedBackgroundPainter extends CustomPainter {
  final double dotRadius;
  final double spacing;
  final Color dotColor;

  DottedBackgroundPainter({
    this.dotRadius = 1.2,
    this.spacing = 16,
    this.dotColor = const Color(0xFFE0E0E0),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
