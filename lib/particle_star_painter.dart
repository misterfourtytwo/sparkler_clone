import 'package:flutter/material.dart';

class ParticleStarPainter extends CustomPainter {
  final double growProgress;
  final double maxLengthModifier;
  final double starPosition;

  const ParticleStarPainter({
    @required this.growProgress,
    this.maxLengthModifier = 1.0,
    this.starPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height * maxLengthModifier * growProgress * 2;

    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width * 0.25;
    paint.color = Color.fromRGBO(255, 255, 160, 1.0);

    Path path = Path();
    double starSize = size.width * 2.5;
    double starBottom = height * starPosition;
    path.moveTo(0, starBottom - starSize);
    path.lineTo(starSize, starBottom);
    path.moveTo(starSize, starBottom - starSize);
    path.lineTo(0, starBottom);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
