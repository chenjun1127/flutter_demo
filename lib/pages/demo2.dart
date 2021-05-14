import 'package:flutter/material.dart';

class Demo2 extends StatelessWidget {
  Demo2({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("Demo2 page"),
      ),
    );
  }
}
