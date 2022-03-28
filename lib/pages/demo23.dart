import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/components/card/CardEntity.dart';
import 'package:flutter_demo/components/card/NewCardA.dart';
import 'package:flutter_demo/components/card/NewCardB.dart';

/// Created by chenjun on 2022/3/28.
/// 类的继承demo
class Demo23 extends StatefulWidget {
  const Demo23({Key key}) : super(key: key);

  @override
  State<Demo23> createState() => _Demo23State();
}

class _Demo23State extends State<Demo23> {
  CardEntity cardEntityA;

  CardEntity cardEntityB = CardEntity("矩形卡片", "001", 200, 200, Colors.cyan, BorderRadius.circular(35));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("类的继承"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewCardA(
                cardEntity: cardEntityA,
              ),
              SizedBox(height: 20),
              NewCardB(
                cardEntity: cardEntityB,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
