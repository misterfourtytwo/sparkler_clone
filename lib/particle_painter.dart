import 'package:flutter/material.dart';

class ParticlePainter extends CustomPainter {
  final double growProgress;
  final double maxLengthModifier;
  final double arcImpact;

  const ParticlePainter({
    @required this.growProgress,
    this.maxLengthModifier = 1.0,
    this.arcImpact,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = growProgress * size.height * maxLengthModifier;

    Paint paint = Paint();

    LinearGradient gradient = LinearGradient(
      colors: <Color>[
        Colors.yellowAccent,
        Colors.orangeAccent,
        Color.fromARGB(30, 255, 255, 255),
        Color.fromARGB(30, 255, 255, 255),
      ],
      stops: [0, .3, .9, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // <double>[0, 0.3, 0.9, 1.0],
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
        width * 10 * arcImpact,
        height * (arcImpact + 1 / 2),
        width,
        height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
