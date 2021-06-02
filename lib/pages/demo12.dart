import 'package:flutter/material.dart';
import 'package:flutter_demo/models/people.dart';

class Demo12 extends StatefulWidget {
  @override
  Demo12State createState() => Demo12State();
}

class Demo12State extends State<Demo12> {
  People people = People("Mary", 30, "mary@hotmail.com", "13723456325");
  Map<String, dynamic> data = {"name": "Jack", "age": 30, "email": "Jack@hotmail.com", "tel": "13480682697"};
  Map<String, dynamic> man = {"name": "Jack", "age": 30, "email": "Jack@hotmail.com", "tel": "13480682697"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo12 page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  data.addAll(<String, dynamic>{"address": "广东省深圳市南山区", "tel": 13756321254});
                  data.addEntries(<String, dynamic>{"address": "广东省深圳市南山区", "tel": 15898633254}.entries);
                  print(data);
                });
              },
              child: Text("map基本用法（点击我）")),
          Container(
            child: Text(data.toString() ?? data),
            width: double.infinity,
            height: 150,
            color: Colors.grey,
            padding: EdgeInsets.all(10),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), child: Text("Json和Bean互转")),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(people.toJson().toString()),
                Text("名称：${people.name}"),
                Text("年龄：${people.age}"),
                Text("邮箱：${people.email}"),
                Text("电话：${people.tel}"),
                Text("新对象：${People.fromJson(man).toJson()}"),
              ],
            ),
            width: double.infinity,
            color: Colors.grey,
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
