import 'package:flutter/material.dart';

class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.toStringShallow(joiner: " page")),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                Text("无参构造器获取参数：" + ModalRoute.of(context).settings.arguments.toString()),
                ElevatedButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.red)),
                    foregroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
                        //获取焦点时的颜色
                        return Colors.blue;
                      } else if (states.contains(MaterialState.pressed)) {
                        //按下时的颜色
                        return Colors.deepPurple;
                      }
                      //默认状态使用灰色
                      return Colors.white;
                    }),
                    //背景颜色
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red[200];
                      }
                      //默认不使用背景颜色
                      return null;
                    }),
                  ),
                  child: Text('返回'),
                  onPressed: () {
                    Navigator.pop(context, "我是Demo3 page返回的数据");
                  },
                )
              ],
            ),
          ),
        ));
  }
}
