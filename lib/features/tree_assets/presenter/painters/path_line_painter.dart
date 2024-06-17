import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';

class PathLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.lightGray
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const Offset start = Offset(16, 0);
    final Offset end = Offset(16, size.height - 18);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
