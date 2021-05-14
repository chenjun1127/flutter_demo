import 'package:flutter/material.dart';

class Demo3 extends StatelessWidget {
  final String text;

  Demo3({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo3 page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                Text(this.text),
                ElevatedButton(
                  child: Text('返回'),
                  onPressed: () {
                    Navigator.pop(context, "我是返回值");
                  },
                )
              ],
            ),
          ),
        ));
  }
}
