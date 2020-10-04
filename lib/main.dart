import 'dart:math';

import 'package:animate_sparkler/sparkler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        home: Scaffold(
          body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(32),
                color: Colors.red[200],
                child: BodyWidget()),
          ),
        ));
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sparkler();
  }
}
