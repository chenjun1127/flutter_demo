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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo1 page"),
      ),
      body: CounterWidget(
        title: '生命周期演示',
      ),
    );
  }
}
