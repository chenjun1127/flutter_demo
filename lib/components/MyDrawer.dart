import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  final List<Map<dynamic, dynamic>> menu;

  final String name;

  static const routes = [
    {"id": "0", "name": "grid-view", IconData: Icons.home},
    {"id": "1", "name": "icon-container", IconData: Icons.one_k},
    {"id": "2", "name": "layout-view", IconData: Icons.add},
    {"id": "3", "name": "icon-container", IconData: Icons.adb}
  ];

  MyDrawer({Key key, this.menu = routes, this.name = "抽屉"}) : super(key: key);

  @override
  MyDrawerState createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(children: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: ClipOval(
          child: Image.network(
            'https://cdn2.jianshu.io/assets/default_avatar/1-04bbeead395d74921af6a4e8214b4f61.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
            width: 130,
            height: 130,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.menu.length, (index) {
          return InkWell(
              onTap: () {
                print(index);
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Row(
                    children: [
                      Expanded(child: Icon(widget.menu[index][IconData]), flex: 1),
                      Expanded(child: Text(widget.menu[index]['name']), flex: 4),
                    ],
                  ),
                ),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(width: .5, color: Colors.grey[300]))),
              ));
        }),
      ),
    ]));
  }
}
