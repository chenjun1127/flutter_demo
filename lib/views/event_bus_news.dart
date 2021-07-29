import 'package:flutter/material.dart';

class EventBusNews extends StatefulWidget {
  const EventBusNews({Key key}) : super(key: key);

  @override
  _EventBusNewsState createState() => _EventBusNewsState();
}

class _EventBusNewsState extends State<EventBusNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息总线"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: Container(
            child: Text('登录成功'),
          ),
        ),
      ),
    );
  }
}
