import 'dart:math';

import 'package:animate_sparkler/particle_painter.dart';
import 'package:flutter/material.dart';

class Particle extends StatefulWidget {
  final Duration growDuration;
  final Duration delayDuration;

  Particle({
    Key key,
    this.growDuration = const Duration(milliseconds: 420),
    this.delayDuration = const Duration(milliseconds: 42),
  }) : super(key: key);

  @override
  _ParticleState createState() => _ParticleState();
}

class _ParticleState extends State<Particle>
    with SingleTickerProviderStateMixin {
  double maxLengthModifier;
  bool visible;
  double arcImpact;

  AnimationController _animationCtrl;

  @override
  void initState() {
    super.initState();

    this._animationCtrl = new AnimationController(
      vsync: this,
      duration: widget.growDuration * Random().nextDouble(),
    );

    _startAnimation(widget.growDuration);

    _animationCtrl.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        visible = false;
        Future.delayed(
          widget.delayDuration * Random().nextDouble(),
        ).then(
          (_) => _startAnimation(widget.growDuration * Random().nextDouble()),
        );
      }
    });

    _animationCtrl.addListener(() => setState(() {}));
  }

  void _startAnimation([Duration duration]) {
    maxLengthModifier = Random().nextDouble();
    visible = true;
    arcImpact = Random().nextDouble() * 2 - 1;
    _animationCtrl.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.5,
      height: 100,
      child: Opacity(
        opacity: visible ? 1 : 0,
        child: CustomPaint(
          painter: ParticlePainter(
            growProgress: _animationCtrl.value,
            maxLengthModifier: maxLengthModifier,
            arcImpact: arcImpact,
          ),
        ),
      ),
    );
  }
}
