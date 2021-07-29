import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerWidget extends StatefulWidget {
  final List<Map<dynamic, dynamic>> menu;

  final String name;

  static const routes = [
    {"id": "0", "name": "登录", IconData: Icons.account_balance, "routeName": "demo20"},
    {"id": "1", "name": "消息总线", IconData: Icons.new_releases, "routeName": "eventBusNews"},
    {"id": "2", "name": "layout-view", IconData: Icons.add, "routeName": ""},
    {"id": "3", "name": "icon-container", IconData: Icons.adb, "routeName": ""}
  ];

  DrawerWidget({Key key, this.menu = routes, this.name = "抽屉"}) : super(key: key);

  @override
  DrawerWidgetState createState() => DrawerWidgetState();
}

class DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
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
            children: List.generate(
              widget.menu.length,
              (index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, widget.menu[index]['routeName']);
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
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: .5, color: Colors.grey[300]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
