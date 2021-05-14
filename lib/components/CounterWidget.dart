import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key, this.title: ""}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return CounterWidgetState();
  }
}

class CounterWidgetState extends State<CounterWidget> {
  int _count = 0;
  // https://book.flutterchina.club/chapter3/flutter_widget_intro.html#_3-1-6-state
  @override
  void initState() {
    super.initState();
    //初始化状态
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(color: Colors.blueGrey, fontSize: 24),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    ++_count;
                  });
                },
                child: Text("$_count"))
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
