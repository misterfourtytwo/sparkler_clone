import 'package:animate_sparkler/fuse_painter.dart';
import 'package:animate_sparkler/particle.dart';
import 'package:flutter/material.dart';

const int count = 400;

class Sparkler extends StatefulWidget {
  final double height = 100;
  final double width = 320;
  @override
  _SparklerState createState() => _SparklerState();
}

class _SparklerState extends State<Sparkler>
    with SingleTickerProviderStateMixin {
  AnimationController _ctrl;

  @override
  void initState() {
    super.initState();

    this._ctrl = new AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 4,
        milliseconds: 200,
      ),
    );
    _ctrl.addListener(() {
      setState(() {});
    });
    _start();
  }

  void _start() {
    _ctrl.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: FusePainter(progress: _ctrl.value),
                ),
                if (_ctrl.isAnimating)
                  for (int i = 1; i <= count; i++)
                    // center child its top is in the center of stack
                    Positioned(
                      left: _ctrl.value * widget.width,
                      top: .5 * widget.height,
                      // rotate random angle, with axis in stack center
                      child: ParticleAnimator(),
                    ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _start,
            child: Text('Fire'),
          ),
        ],
      ),
    );
  }
}
