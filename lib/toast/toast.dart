import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  static OverlayEntry _overlayEntry; //toast靠它加到屏幕上
  static bool _showing = false; //toast是否正在showing
  static DateTime _startedTime; //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static String _msg;
  static void toast(
    BuildContext context,
    String msg,
  ) async {
    assert(msg != null);
    _msg = msg;
    _startedTime = DateTime.now();
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          //top值，可以改变这个值来改变toast在屏幕中的位置
          top: MediaQuery.of(context).size.height * 2 / 3,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: AnimatedOpacity(
              opacity: _showing ? 1.0 : 0.0, //目标透明度
              duration: _showing ? Duration(milliseconds: 100) : Duration(milliseconds: 400),
              child: _buildToastWidget(),
            ),
          ),
        ),
      );
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
    await Future.delayed(Duration(milliseconds: 2000)); //等待两秒

    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.markNeedsBuild();
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Text(
          _msg,
          style: TextStyle(
            fontSize: 14.0,
            decoration: TextDecoration.none,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Ping Fang",
          ),
        ),
      ),
    );
  }
}
