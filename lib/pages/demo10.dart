import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/store/count.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Demo10 extends StatefulWidget {
  final String title;

  Demo10({Key key, @required this.title}) : super(key: key);

  @override
  Demo10State createState() => Demo10State();
}

class Demo10State extends State<Demo10> {
  final CountStore countStore = CountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Mobx基本使用", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('You have pushed the button this many times:'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Observer(
                builder: (_) => Text('${countStore.value}', style: TextStyle(fontSize: 18)),
              ),
            ),
            ElevatedButton(
              child: Text("Increment"),
              // 每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: countStore.increment,
              style: getStyle(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Set"),
              // 每点击一次，将重置为0，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => countStore.set(0),
              style: getStyle(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Decrement"),
              // 每点击一次，将count自减，然后重新build,ShareDataWidget的data将被更新
              onPressed: countStore.decrement,
              style: getStyle(),
            )
          ],
        ),
      ),
    );
  }

  getStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.deepOrangeAccent),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
      minimumSize: MaterialStateProperty.all(Size(120, 44)),
    );
  }
}
