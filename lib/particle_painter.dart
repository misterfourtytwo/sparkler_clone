import 'package:flutter/material.dart';

class ParticlePainter extends CustomPainter {
  final double currentLifetime;
  ParticlePainter({@required this.currentLifetime});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      -currentLifetime * size.height,
    );
    LinearGradient gradient = LinearGradient(
      colors: <Color>[
        Colors.yellowAccent,
        Colors.orangeAccent,
        Color.fromARGB(30, 255, 255, 255),
        Color.fromARGB(30, 255, 255, 255)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // <double>[0, 0.3, 0.9, 1.0],
    );
    paint.shader = gradient.createShader(rect);
    Path path = Path()..addRect(rect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
