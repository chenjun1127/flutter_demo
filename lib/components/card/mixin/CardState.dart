import 'dart:math';

import 'package:flutter/material.dart';

/// Created by chenjun on 2022/3/28.
/// mixin
mixin CardState<T extends StatefulWidget> on State<T> {
  double width = 200;
  double height = 200;

  Color bgColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() {
    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Text(
            bgColor.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      onTap: () => onTap(),
      onLongPress: () => onLongPress(),
    );
  }

  void onTap() {
    setState(() {
      bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void onLongPress() {
    print("长按:${context.widget}");
  }
}
