import 'dart:math';

import 'package:flutter/material.dart';

class Demo21 extends StatefulWidget {
  const Demo21({Key key}) : super(key: key);

  @override
  _Demo21State createState() => _Demo21State();
}

class _Demo21State extends State<Demo21> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final double barWidth = 15.0;
  List<double> heightList = List.generate(8, (index) => index * 30.0);

  @override
  void initState() {
    super.initState();
    heightList.addAll(heightList.reversed.toList());
    print(heightList.toString());
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1), lowerBound: 100, upperBound: 110)
      ..addListener(() {
        print(_controller.value);
        setState(() {
          heightList = List.generate(16, (index) => _controller.value * Random().nextInt(10) / 10);
        });
      })
      ..addStatusListener((status) {
        print("status$heightList");
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          _controller.forward();
        }
      });
    _controller.forward();
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
        title: Text("Demo21 page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("柱状图动画", style: TextStyle(fontSize: 18)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: Text("开始")),
              OutlinedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: Text("停止")),
              OutlinedButton(
                  onPressed: () {
                    _controller.stop();
                    setState(() {
                      heightList = List.generate(8, (index) => index * 30.0);
                      heightList.addAll(heightList.reversed.toList());
                    });
                  },
                  child: Text("重置")),
            ],
          ),
          SizedBox(height: 15),
          Flexible(
            child: Container(
                width: double.infinity,
                color: Colors.grey[400],
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(heightList.length, (index) {
                      return _Cylinder(
                        height: heightList[index],
                        width: barWidth,
                        color: Colors.primaries[index % Colors.primaries.length],
                      );
                    }),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class _Cylinder extends StatelessWidget {
  _Cylinder({Key key, this.width, this.height, this.color}) : super(key: key);
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width, color: color);
  }
}
