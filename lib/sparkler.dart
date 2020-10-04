import 'dart:math';

import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

class Sparkler extends StatefulWidget {
  @override
  _SparklerState createState() => _SparklerState();
}

class _SparklerState extends State<Sparkler> {
  final double width = 300;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: width,
      child: SizedBox(
          height: 100,
          child: Stack(
            children: getParticles(),
          )),
    ));
  }

  List<Widget> getParticles() {
    List<Widget> particles = List();
    int maxParticles = 160;
    for (var i = 1; i <= maxParticles; i++) {
      particles.add(Padding(
          padding: EdgeInsets.only(left: 0.5 * width, top: 20),
          child: Transform.rotate(
              angle: maxParticles / i * pi,
              child: Padding(
                  padding: EdgeInsets.only(top: 40), child: Particle()))));
    }
    return particles;
  }
}
