import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/models/userInfo.dart';

/// InheritedWidget用法，
/// 参考：http://laomengit.com/decode/InheritedWidget.html
class Demo22 extends StatefulWidget {
  const Demo22({Key key}) : super(key: key);

  @override
  _Demo22State createState() => _Demo22State();
}

class _Demo22State extends State<Demo22> {
  UserInfo userInfo = UserInfo(20, "jack");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: Center(
        child: MyInheritedWidget(
          userInfo: userInfo,
          child: A(
            child: F(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("click"),
        onPressed: () {
          setState(() {
            userInfo = UserInfo(26, "Lucy");
          });
        },
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final UserInfo userInfo;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant MyInheritedWidget oldWidget) {
    bool flag = oldWidget.userInfo != userInfo;
    print('updateShouldNotify:$flag');
    return flag;
  }

  MyInheritedWidget({this.userInfo, Widget child}) : super(child: child);
}

class F extends StatefulWidget {
  @override
  State<F> createState() => _FState();
}

class _FState extends State<F> {
  @override
  void initState() {
    super.initState();
    print("F initState");
  }

  @override
  Widget build(BuildContext context) {
    print("F build");
    return Container(
      child: Text(MyInheritedWidget.of(context).userInfo.name),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("F didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print('F dispose');
  }
}

class A extends StatefulWidget {
  final Widget child;

  A({Key key, this.child}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  @override
  void initState() {
    super.initState();
    print("A initState");
  }

  @override
  Widget build(BuildContext context) {
    print('A build');
    return widget.child;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("A didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print('A dispose');
  }
}
