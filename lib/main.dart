import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/components/DrawerWidget.dart';
import 'package:flutter_demo/events/CustomEvent.dart';
import 'package:flutter_demo/routes/routes.dart';
import 'package:flutter_demo/utils/EventBusUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page', list: list),
      routes: {...base, ...routes},
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List list;

  MyHomePage({Key key, this.title, this.list}) : super(key: key);

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

  StreamSubscription loginSubscription;

  var result;

  // 监听Bus events
  void _listen() {
    loginSubscription = eventBus.on<CustomEvent>((event) {
      print("-----${event.type}");
      if (event.type == 1) {
        Fluttertoast.showToast(msg: event.message);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listen();
  }

  @override
  void dispose() {
    loginSubscription.cancel();
    eventBus.off(loginSubscription);
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('You have pushed the button this many times1:'),
                Text('$_counter', style: Theme.of(context).textTheme.headline4),
                Wrap(
                  children: List.generate(
                    widget.list.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blue),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size(100, 36),
                          ),
                        ),
                        onPressed: () {
                          if (index == 2) {
                            Future result = Navigator.pushNamed(context, "demo${widget.list[index] + 1}",
                                arguments: <String, String>{"city": "beijing"});
                            result.then(
                              (value) {
                                if (value == null) {
                                  showAlertDialog().then(
                                    (t) {
                                      if (t == true) {
                                        Navigator.pushNamed(context, "demo${widget.list[index] + 1}",
                                            arguments: <String, String>{"city": "beijing"});
                                      }
                                    },
                                  );
                                } else {
                                  print(value);
                                }
                              },
                            );
                          } else {
                            Navigator.pushNamed(context, "demo${widget.list[index] + 1}");
                          }
                        },
                        child: Text("demo${widget.list[index] + 1}"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 弹出对话框
  Future<bool> showAlertDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("路由返回值为空，请前往页面重新操作"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("确定"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
