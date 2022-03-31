import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/button/common_button.dart';

/// Created by chenjun on 2022/3/30.
///
class Demo24 extends StatefulWidget {
  const Demo24({Key key}) : super(key: key);

  @override
  State<Demo24> createState() => _Demo24State();
}

class _Demo24State extends State<Demo24> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮及点击效果"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              OrbButton.defaultButton(text: "click", radius: 20, width: 200, height: 60),
              SizedBox(height: 20),
              SizedBox(
                height: 800,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  //调整间距
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 10,
                  //加载内容
                  itemBuilder: (BuildContext context, int index) {
                    return _buildWidget(index: index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final Map<int, bool> maskHover = <int, bool>{};

  int currentIndex = 0;

  int clickTime = 0;

  void _setHoverState(int index, bool status) {
    setState(() {
      maskHover[index] = status;
    });
  }

  _buildWidget({int index}) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      onTapDown: (TapDownDetails details) {
        clickTime = DateTime.now().millisecondsSinceEpoch;
        _setHoverState(index, true);
      },
      onTapUp: (TapUpDetails details) {
        final int downTime = DateTime.now().millisecondsSinceEpoch - clickTime;
        final int delayTime = 200 - downTime;
        print("clickTime---downTime:$downTime---delayTime:$delayTime");
        if (delayTime > 0) {
          Timer(Duration(milliseconds: delayTime), () {
            _setHoverState(index, false);
          });
        } else {
          _setHoverState(index, false);
        }
      },
      onTapCancel: () => _setHoverState(index, false),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.primaries[index % Colors.primaries.length],
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Mask(hover: maskHover[index] ?? false),
        ],
      ),
    );
  }
}

class Mask extends StatefulWidget {
  const Mask({Key key, this.hover = false}) : super(key: key);
  final bool hover;

  @override
  _MaskState createState() => _MaskState();
}

class _MaskState extends State<Mask> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: AnimatedOpacity(
        opacity: widget.hover ? 0.4 : 0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: const Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
