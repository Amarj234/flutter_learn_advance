import 'package:flutter/material.dart';
import 'dart:math';



class RenderRadialProgress extends RenderBox {
  double _progress;
  double _strokeWidth;
  Color _backgroundColor;
  Color _progressColor;

  RenderRadialProgress({
    required double progress,
    required double strokeWidth,
    required Color backgroundColor,
    required Color progressColor,
  })  : _progress = progress,
        _strokeWidth = strokeWidth,
        _backgroundColor = backgroundColor,
        _progressColor = progressColor;

  double get progress => _progress;
  set progress(double value) {
    if (_progress != value) {
      _progress = value;
      markNeedsPaint();
    }
  }

  double get strokeWidth => _strokeWidth;
  set strokeWidth(double value) {
    if (_strokeWidth != value) {
      _strokeWidth = value;
      markNeedsLayout();
    }
  }

  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      _backgroundColor = value;
      markNeedsPaint();
    }
  }

  Color get progressColor => _progressColor;
  set progressColor(Color value) {
    if (_progressColor != value) {
      _progressColor = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(100, 100)); // default size
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final center = offset + size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    // Background Circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Arc for Progress
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);
  }
}
