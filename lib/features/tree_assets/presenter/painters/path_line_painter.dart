import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';

class PathLinePainter extends CustomPainter {
  final double endSize;

  PathLinePainter({required this.endSize});

  @override
  void paint(Canvas canvas, Size size) {
    if (size.height <= 16) return;
    final paint = Paint()
      ..color = AppColors.lineGray
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const Offset start = Offset(16, 0);
    final Offset end = Offset(16, size.height - endSize);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
