import 'package:flutter_demo/pages/demo1.dart';
import 'package:flutter_demo/pages/demo2.dart';
import 'package:flutter_demo/pages/demo23.dart';
import 'package:flutter_demo/pages/demo3.dart';
import 'package:flutter_demo/pages/demo4.dart';
import 'package:flutter_demo/pages/demo5.dart';
import 'package:flutter_demo/pages/demo6.dart';
import 'package:flutter_demo/pages/demo7.dart';
import 'package:flutter_demo/pages/demo8.dart';
import 'package:flutter_demo/pages/demo9.dart';
import 'package:flutter_demo/pages/demo10.dart';
import 'package:flutter_demo/pages/demo11.dart';
import 'package:flutter_demo/pages/demo12.dart';
import 'package:flutter_demo/pages/demo13.dart';
import 'package:flutter_demo/pages/demo14.dart';
import 'package:flutter_demo/pages/demo15.dart';
import 'package:flutter_demo/pages/demo16.dart';
import 'package:flutter_demo/pages/demo17.dart';
import 'package:flutter_demo/pages/demo18.dart';
import 'package:flutter_demo/pages/demo19.dart';
import 'package:flutter_demo/pages/demo20.dart';
import 'package:flutter_demo/pages/demo21.dart';
import 'package:flutter_demo/pages/demo22.dart';
import 'package:flutter_demo/views/event_bus_news.dart';
import 'package:flutter_demo/views/flow_menu_page.dart';
import 'package:flutter_demo/views/container_transform.dart';

final List list = List.generate(base.values.length, (index) => index);
final base = {
  "demo1": (context) => new Demo1(),
  "demo2": (context) => new Demo2(),
  "demo3": (context) => new Demo3(),
  "demo4": (context) => new Demo4(),
  "demo5": (context) => new Demo5(),
  "demo6": (context) => new Demo6(),
  "demo7": (context) => new Demo7(),
  "demo8": (context) => new Demo8(),
  "demo9": (context) => new Demo9(title: "Demo9 page"),
  "demo10": (context) => new Demo10(title: "Demo10 page"),
  "demo11": (context) => new Demo11(),
  "demo12": (context) => new Demo12(),
  "demo13": (context) => new Demo13(),
  "demo14": (context) => new Demo14(),
  "demo15": (context) => new Demo15(),
  "demo16": (context) => new Demo16(),
  "demo17": (context) => new Demo17(),
  "demo18": (context) => new Demo18(),
  "demo19": (context) => new Demo19(),
  "demo20": (context) => new Demo20(),
  "demo21": (context) => new Demo21(),
  "demo22": (context) => new Demo22(),
  "demo23": (context) => new Demo23(),
};

final routes = {
  "eventBusNews": (context) => EventBusNews(),
  "flowMenuPage":(context) => FlowMenuPage(),
  "containerTransform":(context) => ContainerTransform(),
};
