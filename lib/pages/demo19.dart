import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/components/CircleProgressPainter.dart';
import 'package:flutter_demo/components/GradientCircularProgressIndicator.dart';
import 'package:flutter_demo/components/TurnBox.dart';

class Demo19 extends StatefulWidget {
  const Demo19({Key key}) : super(key: key);

  @override
  _Demo19State createState() => _Demo19State();
}

class _Demo19State extends State<Demo19> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        isForward ? _animationController.reverse() : _animationController.forward();
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo19 page")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 16,
                          children: [
                            GradientCircularProgressIndicator(
                              colors: [Colors.blue, Colors.blue],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.teal, Colors.cyan],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: CurvedAnimation(parent: _animationController, curve: Curves.decelerate).value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                  colors: [Colors.red, Colors.orange, Colors.red],
                                  radius: 50.0,
                                  strokeWidth: 5.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.red[50],
                                  totalAngle: 1.5 * pi,
                                  value: CurvedAnimation(parent: _animationController, curve: Curves.ease).value),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                  colors: [Colors.blue[700], Colors.blue[200]],
                                  radius: 50.0,
                                  strokeWidth: 3.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.transparent,
                                  value: _animationController.value),
                            ),
                            GradientCircularProgressIndicator(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green[200],
                                Colors.blue,
                                Colors.red
                              ],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: _animationController.value,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child: TweenAnimationBuilder(
                                tween: Tween(begin: 0.0, end: 1.0),
                                duration: Duration(seconds: 3),
                                builder: (BuildContext context, double value, Widget child) {
                                  return CustomPaint(
                                    painter: CircleProgressPainter(value),
                                    child: Center(child: Text('${(value * 100).floor()}%')),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
