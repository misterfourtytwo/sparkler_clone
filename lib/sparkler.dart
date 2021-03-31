import 'dart:math';

import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

class Sparkler extends StatelessWidget {
  final double height = 400;
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

  List<Widget> getParticles([int count = 360]) {
    final List<Widget> particles = <Widget>[
      for (int i = 1; i <= count; i++)
        // center child its top is in the center of stack
        Positioned(
          left: .5 * width,
          top: .5 * height,
          // rotate random angle, with axis in stack center
          child: Transform.rotate(
            alignment: Alignment.topCenter,
            angle: 2 * pi * Random().nextDouble(),
            child: Particle(),
          ),
        ),
    ];

    return particles;
  }
}
