import 'package:flutter/material.dart';
import 'package:flutter_demo/components/GradientButton.dart';
import 'package:flutter_demo/components/TurnBox.dart';

class Demo17 extends StatefulWidget {
  Demo17({Key key}) : super(key: key);

  @override
  _Demo17State createState() => _Demo17State();
}

class _Demo17State extends State<Demo17> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo17 page"),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
              child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 15), child: Text("自定义组件GradientButton")),
              GradientButton(
                child: Text("渐变按钮"),
                colors: [Colors.green, Colors.orange],
                width: double.infinity,
                height: 44,
                onPressed: () {
                  print("自定义组件GradientButton");
                },
              ),
              SizedBox(height: 20),
              GradientButton(
                child: Text("带圆角的渐变按钮"),
                colors: [Colors.green, Colors.orange, Colors.red],
                width: double.infinity,
                height: 44,
                borderRadius: BorderRadius.circular(35),
                onPressed: () {
                  print("自定义组件GradientButton");
                },
              ),
              SizedBox(height: 20),
              TurnBox(child: CircleAvatar(child: Icon(Icons.cached)), speed: 300, turns: _turns),
              SizedBox(height: 20),
              GradientButton(
                child: Text("顺时针旋转1/5圈"),
                colors: [Colors.green, Colors.indigoAccent],
                width: double.infinity,
                height: 44,
                borderRadius: BorderRadius.circular(35),
                onPressed: () {
                  setState(() {
                    _turns += 0.2;
                  });
                },
              ),
              SizedBox(height: 20),
              GradientButton(
                child: Text("逆时针旋转1/5圈"),
                colors: [Colors.green, Colors.indigoAccent],
                width: double.infinity,
                height: 44,
                borderRadius: BorderRadius.circular(35),
                onPressed: () {
                  setState(() {
                    _turns -= 0.2;
                  });
                },
              ),
            ],
          ))),
    );
  }
}
