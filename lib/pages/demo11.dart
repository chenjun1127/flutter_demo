import 'package:flutter/material.dart';

class Demo11 extends StatefulWidget {
  Demo11({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Demo11State createState() => Demo11State(title: this.toStringShallow(joiner: " page"));
}

class Demo11State extends State<Demo11> {
  Demo11State({Key key, this.title});

  final String title;
  PointerEvent _pointerEvent;
  TapDownDetails _tapDownDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // 超出高度才滚动
      body: SingleChildScrollView(
        reverse: true,
        // 滑动到底部回弹效果
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(15), child: Text("原始指针监听", style: TextStyle(fontSize: 16))),
            Listener(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.grey,
                child: Text(_pointerEvent?.position?.toString() ?? "", style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent pointerDownEvent) => setState(() => _pointerEvent = pointerDownEvent),
              onPointerMove: (PointerMoveEvent pointerMoveEvent) => setState(() => _pointerEvent = pointerMoveEvent),
              onPointerUp: (PointerUpEvent pointerUpEvent) => setState(() => _pointerEvent = pointerUpEvent),
            ),
            Padding(padding: EdgeInsets.all(15), child: Text("手势监听", style: TextStyle(fontSize: 16))),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Colors.grey,
                child: Text(_tapDownDetails?.toString() ?? "", style: TextStyle(color: Colors.white)),
              ),
              onTapDown: (TapDownDetails details) {
                print(details.localPosition);
                print(details.globalPosition);
                setState(() {
                  _tapDownDetails = details;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
