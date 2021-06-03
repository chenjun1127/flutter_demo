import 'package:flutter/material.dart';

class Demo15 extends StatefulWidget {
  const Demo15({Key key}) : super(key: key);

  @override
  _Demo15State createState() => _Demo15State();
}

class _Demo15State extends State<Demo15> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    height = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    color = ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
    padding = Tween(begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0)).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo15 page"),
        ),
        body: GestureDetector(
          onTap: () {
            _playAnimation();
          },
          child: Center(
            child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: Colors.black.withOpacity(0.5)),
                ),
                child: AnimatedBuilder(
                  builder: (BuildContext context, Widget child) {
                    return Container(
                      alignment: Alignment.bottomCenter,
                      padding: padding.value,
                      child: Container(
                        color: color.value,
                        width: 50.0,
                        height: height.value,
                      ),
                    );
                  },
                  animation: _controller,
                )),
          ),
        ));
  }
}
