import 'package:flutter/material.dart';

class ParticleRayPainter extends CustomPainter {
  final double growProgress;
  final double maxLengthModifier;
  final double arcImpact;

  const ParticleRayPainter({
    @required this.growProgress,
    this.maxLengthModifier = 1.0,
    this.arcImpact = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = growProgress * size.height * maxLengthModifier;

    Paint paint = Paint();
    LinearGradient gradient = LinearGradient(
      colors: [
        Colors.transparent,
        Color.fromRGBO(255, 255, 160, 1.0),
        Color.fromRGBO(255, 255, 160, 0.7),
        Color.fromRGBO(255, 180, 120, 0.7)
      ],
      stops: [0, size.height * growProgress / 30, 0.6, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    Rect rect = Rect.fromLTWH(
      0,
      0,
      // growProgress * size.height * (1 - maxLengthModifier),
      width,
      height,
    );

    paint.shader = gradient.createShader(rect);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size.width;

    Path path = Path()
      // ..addRect(rect)
      // sets middle point through which to draw a line
      ..cubicTo(
        0,
        0,
        width * 2 * arcImpact,
        height * .5,
        0,
        height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
