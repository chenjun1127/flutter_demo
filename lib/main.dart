import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/demo1.dart';
import 'package:flutter_demo/pages/demo2.dart';
import 'package:flutter_demo/pages/demo3.dart';
import 'package:flutter_demo/pages/demo4.dart';
import 'package:flutter_demo/pages/demo5.dart';
import 'package:flutter_demo/pages/demo6.dart';
import 'package:flutter_demo/pages/demo7.dart';
import 'package:flutter_demo/pages/demo8.dart';
import 'package:flutter_demo/pages/demo9.dart';

import 'components/MyDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "demo1": (context) => new Demo1(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('You have pushed the button this many times1:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            Wrap(
              children: [
                TextButton(
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
                        return Colors.grey;
                      }),
                      //背景颜色
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        //设置按下时的背景颜色
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue[200];
                        }
                        //默认不使用背景颜色
                        return null;
                      }),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "demo1");
                    },
                    child: Text('demo1')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo2(title: "Demo2 page");
                      }));
                    },
                    child: Text('demo2')),
                TextButton(
                    onPressed: () async {
                      var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo3(text: "我是第三个页面的提示");
                      }));
                      print("路由返回值: $result");
                    },
                    child: Text('demo3')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo4(title: "Demo4 page");
                      }));
                    },
                    child: Text('demo4')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo5(title: "Demo5 page");
                      }));
                    },
                    child: Text('demo5')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo6(title: "Demo6 page");
                      }));
                    },
                    child: Text('demo6')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo7(title: "Demo7 page");
                      }));
                    },
                    child: Text('demo7')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo8(title: "Demo8 page");
                      }));
                    },
                    child: Text('demo8')),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Demo9(title: "Demo9 page");
                      }));
                    },
                    child: Text('demo9'))
              ],
            ),
          ],
        )),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
