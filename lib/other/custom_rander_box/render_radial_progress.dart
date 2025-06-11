import 'package:flutter/material.dart';
import 'render_box.dart';


class RadialProgress extends LeafRenderObjectWidget {
  final double progress; // 0.0 - 1.0
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  const RadialProgress({
    super.key,
    required this.progress,
    this.strokeWidth = 8,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = const Color(0xFF2196F3),
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRadialProgress(
      progress: progress,
      strokeWidth: strokeWidth,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderRadialProgress renderObject) {
    renderObject
      ..progress = progress
      ..strokeWidth = strokeWidth
      ..backgroundColor = backgroundColor
      ..progressColor = progressColor;
  }
}
