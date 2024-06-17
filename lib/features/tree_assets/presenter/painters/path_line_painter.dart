import 'package:flutter/material.dart';

class PathLinePainter extends CustomPainter {
  final double endSize;

  PathLinePainter({required this.endSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(.06)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    const Offset start = Offset(16, 0);
    final Offset end = Offset(16, size.height - endSize);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
