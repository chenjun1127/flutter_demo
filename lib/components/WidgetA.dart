import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/ShareDataWidget.dart';

class WidgetA extends StatefulWidget {
  @override
  WidgetAState createState() {
    return WidgetAState();
  }
}

class WidgetAState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    // 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    // 如果build中没有依赖InheritedWidget，则此回调不会被调用。
    super.didChangeDependencies();
    print("Dependencies change");
  }
}
