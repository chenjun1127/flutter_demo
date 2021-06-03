import 'package:flutter/material.dart';
import 'package:flutter_demo/components/MySlideTransition.dart';
import 'package:flutter_demo/components/SliderTransition.dart';

class Demo16 extends StatefulWidget {
  const Demo16({Key key}) : super(key: key);

  @override
  _Demo16State createState() => _Demo16State();
}

class _Demo16State extends State<Demo16> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _count0 = 0;
  int _count1 = 0;
  int _count2 = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo16 page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count0',
                // 显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count0),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              child: Text('+1'),
              onPressed: () {
                setState(() {
                  _count0 += 1;
                });
              },
            ),
            Divider(
              height: 20,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
                return MySlideTransition(
                  child: child,
                  position: tween.animate(animation),
                );
              },
              child: Text(
                '$_count1',
                // 显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count1),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              child: Text('+1'),
              onPressed: () {
                setState(() {
                  _count1 += 1;
                });
              },
            ),
            Divider(
              height: 20,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SliderTransition(
                  child: child,
                  direction: AxisDirection.left,
                  position: animation,
                );
              },
              child: Text(
                '$_count2',
                // 显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count2),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              child: Text('+1'),
              onPressed: () {
                setState(() {
                  _count2 += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
