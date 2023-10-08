import 'dart:math';
import 'package:flutter/material.dart';

class LineDrawer extends StatelessWidget {
  final List<LineConfig> lineConfigs;
  final double width;
  final double height;

  LineDrawer({
    required this.lineConfigs,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: LinePainter(lineConfigs),
    );
  }
}

class LineConfig {
  final double length;
  final double angle; // Angle in degrees
  final bool drawArrow; // Flag to specify whether to draw an arrow
  final bool drawDot; // Flag to specify whether to draw a dot
  final bool roundedTurn; // Flag to specify whether to create a rounded turn

  LineConfig(
    this.length,
    this.angle, {
    this.drawArrow = true,
    this.drawDot = true,
    this.roundedTurn = false,
  });
}

class LinePainter extends CustomPainter {
  final List<LineConfig> lineConfigs;

  LinePainter(this.lineConfigs);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 43, 93, 45)
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 2.0;

    final arrowPaint = Paint()
      ..color = const Color.fromARGB(255, 43, 93, 45)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill; // Filled arrowheads

    double x = size.width / 2;
    double y = size.height / 2;
    double currentAngle = 0;

    for (int i = 0; i < lineConfigs.length; i++) {
      final config = lineConfigs[i];
      final length = config.length;
      final angleRadians = (currentAngle + config.angle) * (pi / 180.0);

      final dx = x + length * cos(angleRadians);
      final dy = y + length * sin(angleRadians);

      final startPoint = Offset(x, y);
      final endPoint = Offset(dx, dy);

      if (config.roundedTurn && i < lineConfigs.length - 1) {
        final nextConfig = lineConfigs[i + 1];
        final angleDifference = nextConfig.angle - config.angle;
        if (angleDifference != 0) {
          final radius = length / (2 * sin(angleDifference * pi / 360.0));
          final arcRect = Rect.fromCircle(center: endPoint, radius: radius);
          final startAngle = angleRadians - (pi / 2);
          final sweepAngle = angleDifference * (pi / 180.0);

          canvas.drawArc(arcRect, startAngle, sweepAngle, false, paint);
        }
      } else {
        // Draw the line
        canvas.drawLine(startPoint, endPoint, paint);
      }

      // Draw an arrowhead at the end of the line if desired
      if (config.drawArrow) {
        final arrowLength = 10.0; // Length of the arrowhead
        final arrowAngle = 20.0; // Angle of the arrowhead
        final arrowRadians =
            (currentAngle + config.angle + 180 - arrowAngle) * (pi / 180.0);

        final arrowX1 = dx + arrowLength * cos(arrowRadians);
        final arrowY1 = dy + arrowLength * sin(arrowRadians);

        final arrowRadians2 =
            (currentAngle + config.angle + 180 + arrowAngle) * (pi / 180.0);

        final arrowX2 = dx + arrowLength * cos(arrowRadians2);
        final arrowY2 = dy + arrowLength * sin(arrowRadians2);

        final arrowBase = Offset(dx, dy);

        canvas.drawLine(arrowBase, Offset(arrowX1, arrowY1), arrowPaint);
        canvas.drawLine(arrowBase, Offset(arrowX2, arrowY2), arrowPaint);
      }

      // Draw a dot at the end of the line if desired
      if (config.drawDot) {
        canvas.drawCircle(endPoint, 4.0, paint);
      }

      x = dx;
      y = dy;
      currentAngle += config.angle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
