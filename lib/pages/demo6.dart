import 'package:flutter/material.dart';
import 'package:flutter_demo/tabs/news.dart';
import 'package:flutter_demo/tabs/other.dart';
import 'package:flutter_demo/tabs/picture.dart';

class Demo6 extends StatefulWidget {
  Demo6({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Demo6State createState() => Demo6State(this.title);
}

class Demo6State extends State<Demo6> with SingleTickerProviderStateMixin {
  Demo6State(this.str);

  TabController _tabController;
  final String str;
  int selectedIndex = 0;
  List tabs = ["新闻", "美图", "段子"];

  void handleTap(value) {
    print(value);
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str),
        actions: [IconButton(icon: Icon(Icons.add_sharp), onPressed: () {})],
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
          indicatorColor: Colors.red[600],
          onTap: (index) {
            print(index);
          },
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          // children: tabs.map((e) => Container(alignment: Alignment.center, child: Text(e, textScaleFactor: 5))).toList(),
          // 可以在这里获取索引以及渲染组件
          children: createChildren(tabs)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Business",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "School",
          )
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: handleTap,
      ),
    );
  }

  List<Widget> createChildren(List tabs) {
    // 可以MapEntry在这里获取索引以及渲染组件
    return tabs.asMap().map((i, item) => MapEntry(i, rendContent(item, i))).values.toList();
  }

  Widget rendContent(String item, int i) {
    switch (i) {
      case 0:
        return News();
        break;
      case 1:
        return Picture();
        break;
      case 2:
        return Other();
        break;
      default:
        return null;
    }
  }
}
