import 'package:animate_sparkler/fuse_painter.dart';
import 'package:animate_sparkler/particle_box.dart';
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
                  ParticleBox(
                    progress: _ctrl.value,
                    width: widget.width,
                    height: widget.height,
                    count: count,
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
