import 'package:flutter/material.dart';
import 'package:flutter_demo/components/Loading.dart';
import 'package:flutter_demo/utils/httpUtil.dart';

/*
 * @Description 下拉刷新，上拉加载demo
 * @Author chenjun
 * @Date 2021/5/8
 * @Param
 * @Return
 */
class News extends StatefulWidget {
  @override
  NewsState createState() {
    return NewsState();
  }
}

class NewsState extends State<News> {
  int page = 1;
  int count = 10;
  List list = [];
  ScrollController scrollController = ScrollController();

  void getData() async {
    var res = await HttpUtil.get(url: 'https://api.apiopen.top/getWangYiNews', data: {"page": page, "count": count});
    setState(() {
      final data = res["result"];
      for (var item in data) {
        list.add(item);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print("上拉加载更多");
        getMore();
      }
    });
  }

  // 上拉加载更多
  Future<Null> getMore() async {
    Future.delayed(Duration(seconds: 1), () {
      //为了测试，随机添加7条原有_list中的数据
      setState(() {
        page++;
        getData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.separated(
        controller: scrollController,
        // 下拉加载更多需要显示一个加载组件，需要占用一个listTitle位置，所以长度需要+1
        itemCount: list.length + 1,
        itemBuilder: (BuildContext context, int index) => buildRow(index),
        // 子项的分割线
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        page = 1;
        list.clear();
        getData();
      });
    });
  }

  Widget buildRow(int index) {
    if (index < list.length) {
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: ListTile(
          title: Text(list[index]['title']),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(list[index]['image'].toString().replaceAll("http", "https")),
          ),
        ),
      );
    }
    return getMoreWidget();
  }

  // 上拉加载更多组件
  Widget getMoreWidget() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Loading(
            text: "数据加载中...",
          )),
    );
  }
}
