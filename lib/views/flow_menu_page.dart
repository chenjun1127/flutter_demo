import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowMenuPage extends StatefulWidget {
  const FlowMenuPage({Key key}) : super(key: key);

  @override
  _FlowMenuPageState createState() => _FlowMenuPageState();
}

class _FlowMenuPageState extends State<FlowMenuPage> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationCircleController;
  IconData lastTapped = Icons.notifications;
  List<IconData> menuItems = [Icons.home, Icons.new_releases, Icons.notifications, Icons.settings, Icons.menu];

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter = MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
    return Padding(
      padding: EdgeInsets.all(10),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        // ConstrainedBox 约束子组件
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () => _updateMenu(icon),
        child: Icon(icon, color: Colors.white, size: 30.0),
      ),
    );
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animationCircleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250), lowerBound: 0, upperBound: 80);
    animationCircleController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow menu page"),
      ),
      body: Stack(
        children: [
          Container(
            child: Flow(
              delegate: FlowMenuDelegate(animation: animationController),
              children: menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
            ),
          ),
          Positioned(
            left: 0,
            top: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Flow(
                      delegate: FlowAnimatedCircle(animationCircleController.value),
                      children: List.generate(
                        5,
                        (index) => Container(
                          child: Icon(
                            index.isEven ? Icons.timer : Icons.ac_unit,
                            size: 32,
                            color: Colors.primaries[index % Colors.primaries.length],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() {
                          //点击后让动画可前行或回退
                          animationCircleController.status == AnimationStatus.completed
                              ? animationCircleController.reverse()
                              : animationCircleController.forward();
                        });
                      },
                      highlightColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    } else {
      animationController.status == AnimationStatus.completed
          ? animationController.reverse() //展开和收拢的效果
          : animationController.forward();
    }
  }

  @override
  void dispose() {
    animationCircleController.dispose(); //销毁变量,释放资源
    super.dispose();
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({this.animation}) : super(repaint: animation);
  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 50.0; //起始位置
    double y = 20.0; //横向展开,y不变
    for (int i = 0; i < context.childCount; ++i) {
      x = context.getChildSize(i).width * i * animation.value;
      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final double radius; //绑定半径,让圆动起来
  FlowAnimatedCircle(this.radius);

  @override
  void paintChildren(FlowPaintingContext context) {
    if (radius == 0) return;
    double x = 0; //开始(0,0)在父组件的中心
    double y = 0;
    for (int i = 0; i < context.childCount; i++) {
      x = radius * cos(i * pi / (context.childCount - 1)); //根据数学得出坐标
      y = radius * sin(i * pi / (context.childCount - 1)); //根据数学得出坐标
      context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => true;
}
