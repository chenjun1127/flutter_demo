import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo14 extends StatefulWidget {
  @override
  Demo14State createState() => Demo14State();
}

class Demo14State extends State<Demo14> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;
  Animation curve;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    curve = new CurvedAnimation(parent: animationController, curve: Curves.linear);
    animation = new Tween(begin: 100.0, end: 300.0).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo14 page"),
      ),
      body: Center(
        child: Image.network(
          'https://cdn2.jianshu.io/assets/default_avatar/1-04bbeead395d74921af6a4e8214b4f61.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
          width: animation.value,
          height: animation.value,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
