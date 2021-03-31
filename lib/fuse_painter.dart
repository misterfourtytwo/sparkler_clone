import 'package:flutter/material.dart';

class FusePainter extends CustomPainter {
  const FusePainter({
    @required this.progress,
    this.height = 4,
  });

  final double progress;
  final double height;
  @override
  void paint(Canvas canvas, Size size) {
    double burntStickHeight = height * 0.75;
    double burntStickWidth = progress * size.width;
    _drawBurntStick(burntStickHeight, burntStickWidth, size, canvas);
    _drawIntactStick(burntStickWidth, size, canvas);
  }

  void _drawBurntStick(double burntStickHeight, double burntStickWidth,
      Size size, Canvas canvas) {
    double startHeat = progress - 0.1 <= 0 ? 0 : progress - 0.1;
    double endHeat = progress + 0.05 >= 1 ? 1 : progress + 0.05;
    LinearGradient gradient = LinearGradient(colors: [
      Color.fromARGB(255, 80, 80, 80),
      Color.fromARGB(255, 100, 80, 80),
      Colors.red,
      Color.fromARGB(255, 130, 100, 100),
      Color.fromARGB(255, 130, 100, 100)
    ], stops: [
      0,
      startHeat,
      progress,
      endHeat,
      1.0
    ]);
    Paint paint = Paint();
    Rect rect = Rect.fromLTWH(0, size.height / 2 - burntStickHeight / 2,
        size.width, burntStickHeight);
    paint.shader = gradient.createShader(rect);
    Path path = Path()..addRect(rect);
    canvas.drawPath(path, paint);
  }

  void _drawIntactStick(double burntStickWidth, Size size, Canvas canvas) {
    Paint paint = Paint()..color = Color.fromARGB(255, 100, 100, 100);
    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(burntStickWidth, size.height / 2 - height / 2,
              size.width - burntStickWidth, height),
          Radius.circular(3),
        ),
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
