import 'package:flutter/material.dart';

class SliderTransition extends AnimatedWidget {
  static Tween<Offset> _tween;

  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  // 退场（出）方向
  final AxisDirection direction;

  SliderTransition({Key key, @required Animation<double> position, this.transformHitTests = true, this.direction = AxisDirection.down, this.child})
      : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
