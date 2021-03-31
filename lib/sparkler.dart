import 'package:animate_sparkler/fuse_painter.dart';
import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

const int count = 400;

class Sparkler extends StatelessWidget {
  final double height = 100;
  final double width = 320;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: FusePainter(progress: .5),
            ),
            for (int i = 1; i <= count; i++)
              // center child its top is in the center of stack
              Positioned(
                left: .5 * width,
                top: .5 * height,
                // rotate random angle, with axis in stack center
                child: ParticleAnimator(),
              ),
          ],
        ),
      ),
    );
  }
}
