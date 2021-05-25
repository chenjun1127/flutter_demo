import 'package:flutter/material.dart';

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.toStringShallow(joiner: " page")),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(this.toString()),
      ),
    );
  }
}
