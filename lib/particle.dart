import 'package:animate_sparkler/particle_painter.dart';
import 'package:flutter/material.dart';

class Particle extends StatefulWidget {
  final Duration duration;
  Particle({
    this.duration = const Duration(milliseconds: 200),
    Key key,
  }) : super(key: key);

  @override
  _ParticleState createState() => _ParticleState();
}

class _ParticleState extends State<Particle>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    this._controller = new AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _startNextAnimation();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startNextAnimation();
      }
    });
    _controller.addListener(() => setState(() {}));
  }

  void _startNextAnimation([Duration after]) {
    Future.delayed(Duration(milliseconds: 200), () {
      _controller.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      height: 240,
      child: CustomPaint(
        painter: ParticlePainter(currentLifetime: _controller.value),
      ),
    );
  }
}
