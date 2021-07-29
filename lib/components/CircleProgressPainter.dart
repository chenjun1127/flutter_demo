import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress;

  CircleProgressPainter(this.progress);

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.red
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;

    Gradient gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi * 2 * progress,
      colors: [
        Color(0xFFD32D2F),
        Color(0xFFEA4886),
      ],
    );
    var rect = Rect.fromLTWH(0, 0, radius * 2, radius * 2);

    _paint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);

    canvas.drawArc(rect, 0, pi * 2 * progress, false, _paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
