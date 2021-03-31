import 'dart:math';

import 'package:animate_sparkler/particle_ray_painter.dart';
import 'package:animate_sparkler/particle_star_painter.dart';
import 'package:flutter/material.dart';

class ParticleAnimator extends StatefulWidget {
  final Duration growDuration;
  final Duration delayDuration;

  ParticleAnimator({
    Key key,
    this.growDuration = const Duration(milliseconds: 1000),
    this.delayDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  _ParticleAnimatorState createState() => _ParticleAnimatorState();
}

class _ParticleAnimatorState extends State<ParticleAnimator>
    with SingleTickerProviderStateMixin {
  double maxLengthModifier;
  bool visible;
  double arcImpact;
  bool showStar;
  double starPosition;

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
    showStar = Random().nextDouble() < 0.3;
    if (showStar) {
      starPosition = Random().nextDouble() + 0.5;
    } else {
      arcImpact = Random().nextDouble() * 2 - 1;
    }
    visible = true;
    _animationCtrl.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: Alignment.topCenter,
      angle: 2 * pi * Random().nextDouble(),
      child: SizedBox(
        width: 1.5,
        height: 60,
        child: Opacity(
          opacity: visible ? 1 : 0,
          child: CustomPaint(
            painter: showStar
                ? ParticleStarPainter(
                    growProgress: _animationCtrl.value,
                    maxLengthModifier: maxLengthModifier,
                    starPosition: starPosition,
                  )
                : ParticleRayPainter(
                    growProgress: _animationCtrl.value,
                    maxLengthModifier: maxLengthModifier,
                    arcImpact: arcImpact,
                  ),
          ),
        ),
      ),
    );
  }
}
