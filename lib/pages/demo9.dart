import 'package:flutter/material.dart';
import 'package:flutter_demo/components/Loading.dart';
import 'package:flutter_demo/utils/httpUtil.dart';

class Demo9 extends StatefulWidget {
  Demo9({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Demo9State createState() => Demo9State();
}

class Demo9State extends State<Demo9> {
  Future getData() async {
    return HttpUtil.post(url: 'https://api.apiopen.top/getWangYiNews');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return createListView(context, snapshot);
              }
            } else {
              // 请求未结束，显示loading
              return Container(height: MediaQuery.of(context).size.height, child: Loading());
            }
          }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, news) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    print(index);
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              news[index]['image'].toString().replaceAll("http", "https"),
              fit: BoxFit.contain,
              width: 100,
              height: 90,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news[index]['title']),
                  SizedBox(height: 8),
                  Text(news[index]['passtime'], style: TextStyle(color: Colors.grey[600])),
                ],
              ))
        ],
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List news = snapshot.data['result'];
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, news),
      itemCount: news.length * 2,
    );
  }
}
