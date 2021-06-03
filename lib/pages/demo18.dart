import 'dart:math';

import 'package:flutter/material.dart';

class Demo18 extends StatelessWidget {
  const Demo18({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo18 page"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text("Canvas基本绘制", style: TextStyle(fontSize: 18)),
                ),
                flex: 1),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blueGrey,
                child: CustomPaint(
                  size: Size(double.infinity, 300),
                  painter: MyCustomPainter(),
                ),
              ),
              flex: 10,
            )
          ],
        ));
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;
    print("$eWidth,$eHeight");
    Paint paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0xffff9900);
    canvas.drawRect(Offset.zero & size, paint);
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.white30
      ..strokeWidth = 1.0;
    for (int i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for (int i = 0; i <= 15; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
    // 画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(Offset((size.width - eWidth) / 2, (size.height - eHeight) / 2), min(eWidth / 2, eHeight / 2) - 2, paint);
    // 画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2), min(eWidth / 2, eHeight / 2) - 2, paint);
  }

  // 在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
