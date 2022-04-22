import 'package:flutter/material.dart';
import 'package:flutter_demo/components/CounterWidget.dart';

class Demo1 extends StatefulWidget {
  Demo1({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Demo1State();
  }
}

class Demo1State extends State<Demo1> {
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  double width, height;

  @override
  Widget build(BuildContext context) {
    Shader shader = LinearGradient(colors: [Colors.purple, Colors.orangeAccent, Colors.blue])
        .createShader(Rect.fromLTWH(0.0, 0.0, width ?? 283, height ?? 46));

    return Scaffold(
      appBar: AppBar(
        title: Text("Demo1 page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterWidget(
            key: _key1,
            title: '生命周期演示',
          ),
          Text(
            "这是一段渐变文字...",
            key: _key2,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, foreground: Paint()..shader = shader),
          ),
          TextButton(onPressed: _getWidgetHeight, child: Text('获取widget的高度')),
          SizedBox(height: 160),
          Text("渐变文字：{width:$width,height:$height}")
        ],
      )),
    );
  }

  void _getWidgetHeight() {
    print(_key2.currentContext.size);
    setState(() {
      width = _key2.currentContext.size.width;
      height = _key2.currentContext.size.height;
    });
  }
}
