import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/ShareDataWidget.dart';
import 'package:flutter_demo/components/WidgetA.dart';
import 'package:flutter_demo/components/WidgetB.dart';

class Demo7 extends StatefulWidget {
  Demo7({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Demo7State createState() => Demo7State();
}

class Demo7State extends State<Demo7> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ShareDataWidget(
            data: count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(children: [WidgetA(), WidgetB()]), // 子widget中依赖ShareDataWidget
                ),
                ElevatedButton(
                  child: Text("Increment"),
                  // 每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                  onPressed: () => setState(() => ++count),
                )
              ],
            ),
          ),
        ));
  }
}
