import 'dart:math';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("canvas绘制", style: TextStyle(fontSize: 24)),
              ),
              Container(
                  width: 300,
                  height: 300,
                  color: Colors.green,
                  child: CustomPaint(
                    size: Size(double.infinity, 300),
                    painter: MyCustomPainter(),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 5),
                      ),
                      child: Stack(
                        children: [
                          // Positioned(child: Text("我是CustomPaint的child"),left: TextAlign.center,bottom: 30,),
                          Align(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 50),
                              child: Text(
                                "Child",
                                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                          Center(
                            child: Text(
                              "96",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}

/*
 * @Description 圆弧绘制，1度 = pi / 180，所以起始度数 = 度数 * pi / 180;
 * @Author chenjun
 * @Date 2021/6/3
 * @Param
 * @Return
 */
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 90), -240 * pi / 180, 300 * pi / 180, false, paint);
    paint.strokeWidth = 2;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 85), -240 * (pi / 180), 300 * (pi / 180), false, paint);
    paint.strokeWidth = 1;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 80), -240 * (pi / 180), 300 * (pi / 180), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
