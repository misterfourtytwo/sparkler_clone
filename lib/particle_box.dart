import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

class ParticleBox extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final int count;

  const ParticleBox({
    Key key,
    @required this.progress,
    @required this.width,
    @required this.height,
    this.count = 420,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        for (int i = 1; i <= count; i++)
          // center child its top is in the center of stack
          Positioned(
            left: progress * width,
            top: .5 * height,
            // rotate random angle, with axis in stack center
            child: ParticleAnimator(),
          ),
      ],
    );
  }
}
