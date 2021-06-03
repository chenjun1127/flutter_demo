import 'package:flutter/material.dart';

class Demo13 extends StatefulWidget {
  Demo13({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Demo13State createState() => Demo13State(title: this.toStringShallow(joiner: " page"));
}

class Demo13State extends State<Demo13> with SingleTickerProviderStateMixin {
  String title;
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  Demo13State({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo12 page")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Stack(
          children: [
            Positioned(
              left: _left,
              top: _top,
              child: Listener(
                child: GestureDetector(
                  child: CircleAvatar(child: Text("A")),
                  onPanDown: (DragDownDetails e) {
                    //打印手指按下的位置(相对于屏幕)
                    print("用户手指按下：${e.globalPosition}");
                  },
                  //手指滑动时会触发此回调
                  onPanUpdate: (DragUpdateDetails e) {
                    //用户手指滑动时，更新偏移，重新构建
                    print("${e.globalPosition.dx},${e.globalPosition.dy}");
                    setState(() {
                      _left += e.delta.dx;
                      _top += e.delta.dy;
                    });
                  },
                  onPanEnd: (DragEndDetails e) {
                    //打印滑动结束时在x、y轴上的速度
                    print(e.velocity);
                  },
                  onTapDown: (details) {
                    print("down");
                  },
                  onTapUp: (details) {
                    print("up");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
