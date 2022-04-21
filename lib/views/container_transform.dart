import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/toast/toast.dart';

class ContainerTransform extends StatefulWidget {
  const ContainerTransform({Key key}) : super(key: key);

  @override
  _ContainerTransformState createState() => _ContainerTransformState();
}

class _ContainerTransformState extends State<ContainerTransform> {
  String message = "";
  final ScrollController _controller = ScrollController();

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Start";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    print("metrics.pixels:${metrics.pixels}");
    if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
      print("滚动到底部了");
      Toast.toast(context, "滚动到底部了");
    }
    setState(() {
      message = "Scroll Update";
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll End";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Transform--$message"),
      ),
      body: NotificationListener(
        onNotification: handleOnNotification,
        child: GridView.builder(
          controller: _controller,
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return OpenContainer(
              transitionDuration: Duration(milliseconds: 200),
              closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0)),
              ),
              openBuilder: (BuildContext context, void Function({Object returnValue}) action) {
                return Scaffold(
                  appBar: AppBar(title: Text("Material motion")),
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset("images/bg1.jpg", fit: BoxFit.fill),
                  ),
                );
              },
              closedBuilder: (BuildContext context, void Function() action) {
                return Container(
                  child: Image.asset('images/bg2.jpg', fit: BoxFit.fill),
                );
              },
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }

  bool handleOnNotification(Notification notification) {
    if (notification is ScrollStartNotification) {
      _onStartScroll(notification.metrics);
    } else if (notification is ScrollUpdateNotification) {
      _onUpdateScroll(notification.metrics);
    } else if (notification is ScrollEndNotification) {
      _onEndScroll(notification.metrics);
    }
    return true;
  }
}
