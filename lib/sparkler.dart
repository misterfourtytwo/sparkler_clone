import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

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
          children: getParticles(),
        ),
      ),
    );
  }

  List<Widget> getParticles([int count = 720]) {
    final List<Widget> particles = <Widget>[
      for (int i = 1; i <= count; i++)
        // center child its top is in the center of stack
        Positioned(
          left: .5 * width,
          top: .5 * height,
          // rotate random angle, with axis in stack center
          child: ParticleAnimator(),
        ),
    ];

    return particles;
  }
}
