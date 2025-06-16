import 'dart:math';
import 'package:flutter/material.dart';
import 'package:type2_diabetes_riskscore/helpers/appcolors.dart';

class SemiCircleGauge extends StatelessWidget {
  final double value; // 0.0 to 1.0

  SemiCircleGauge({required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.containercolor, // light green background
      body: Center(
        child: CustomPaint(
          size: Size(250, 125), // width, height
          painter: GaugePainter(value),
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double value;

  GaugePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = pi;
    final sweepAngle = pi;

    // Draw semi-circle background
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

    // Draw border
    final borderPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, startAngle, sweepAngle, false, borderPaint);

    // Draw pointer
    final angle = pi * value; // value from 0 to 1
    final pointerPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
    final pointerX = center.dx + radius * cos(angle - pi);
    final pointerY = center.dy + radius * sin(angle - pi);
    canvas.drawLine(center, Offset(pointerX, pointerY), pointerPaint);

    // Draw knob
    final knobPaint = Paint()..color = Colors.black;
    canvas.drawCircle(center, 5, knobPaint);

    // Draw Labels
    final textPainterNormal = buildText('Normal', Colors.green);
    textPainterNormal.paint(canvas, Offset(0, center.dy - 10));

    final textPainterHigh = buildText('High', Colors.red);
    textPainterHigh.paint(canvas, Offset(size.width - 40, center.dy - 10));

    final textPainterModerate = buildText('Moderate', Colors.orange);
    textPainterModerate.paint(canvas, Offset(center.dx - 35, size.height + 10));
  }

  TextPainter buildText(String text, Color color) {
    final textStyle = TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
