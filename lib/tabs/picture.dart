import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/components/Loading.dart';
import 'package:flutter_demo/components/PhotoViewGalleryScreen.dart';
import 'package:flutter_demo/components/ImageWidget.dart';
import 'package:flutter_demo/utils/httpUtil.dart';

class Picture extends StatefulWidget {
  @override
  PictureState createState() {
    return PictureState();
  }
}

class PictureState extends State<Picture> {
  int page = 0;
  int count = 5 * 3;
  List list = [];
  var queryArr = ["美女", "鞠婧祎", "网红", "深圳"];
  var query = "nba";
  int total;
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  void getData() async {
    var res = await HttpUtil.get(
        url: 'https://pic.sogou.com/pics/json.jsp',
        data: {"query": query, "start": page, "xml_len": count});
    var data = jsonDecode(res);
    setState(() {
      total = data["totalNum"];
      for (var item in data["items"]) {
        list.add(item);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("上拉加载更多");
        print(list.length);
        setState(() {
          isLoading = list.length >= total ? false : true;
        });
        if (isLoading) getMore();
      }
    });
    setState(() {
      query = queryArr[Random().nextInt(queryArr.length)];
      getData();
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

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        page = 0;
        list.clear();
        isLoading = false;
        getData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
              child: CustomScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsets.all(20), child: Text(query))),
                  SliverPadding(
                      padding: EdgeInsets.all(0),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PhotoViewGalleryScreen(
                                      images: list,
                                      index: index,
                                      heroTag: "img");
                                }));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                // color: Colors.cyan[100 * (index % 9)],
                                color: Colors.grey[200],
                                child: ImageWidget(
                                  url: list[index]['picUrl']
                                      .toString()
                                      .replaceAll(RegExp(r'^http$'), "https"),
                                  w: (MediaQuery.of(context).size.width - 20) /
                                      3,
                                  h: (MediaQuery.of(context).size.width - 20) /
                                      3,
                                ),
                              ),
                            );
                          }, childCount: list.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10.0,
                          ))),
                  SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child:
                              Visibility(child: Loading(), visible: isLoading)))
                ],
              ),
              onRefresh: _onRefresh),
          Positioned(
              bottom: 15,
              right: 15,
              child: TextButton(
                child: Text("换一换",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                style: ButtonStyle(
                    // 背景颜色
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // 设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      // 默认不使用背景颜色
                      return Colors.blue;
                    }),
                    minimumSize: MaterialStateProperty.all(Size(100, 44)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50))))),
                onPressed: () {
                  setState(() {
                    query = queryArr[Random().nextInt(queryArr.length)];
                    page = 0;
                    list.clear();
                    getData();
                  });
                },
              ))
        ],
      ),
    );
  }
}
