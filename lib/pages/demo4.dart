import 'package:flutter/material.dart';
import 'package:flutter_demo/components/ParentWidget.dart';
import 'package:flutter_demo/components/TapBoxA.dart';

class Demo4 extends StatelessWidget {
  Demo4({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Wrap(
            children: [
              TapBoxA(),
              ParentWidget(),
            ],
          ),
        ));
  }
}
