import 'package:flutter/material.dart';

/*
 * @Description 封装图片加载控件，增加图片加载失败时加载默认图片
 * @Author chenjun
 * @Date 2021/5/12
 * @Param
 * @Return
 */
class ImageWidget extends StatefulWidget {
  ImageWidget({@required this.url, this.w, this.h, this.defImagePath = "images/network-fail.png"});

  final String url;
  final double w;
  final double h;
  final String defImagePath;

  @override
  State<StatefulWidget> createState() {
    return _StateImageWidget();
  }
}

class _StateImageWidget extends State<ImageWidget> {
  Image _image;

  @override
  void initState() {
    super.initState();
    _image = Image.network(
      widget.url,
      width: widget.w,
      height: widget.h,
      fit: BoxFit.cover,
    );
    var resolve = _image.image.resolve(ImageConfiguration.empty);
    resolve.addListener(ImageStreamListener((_, __) {
      //加载成功
    }, onError: (dynamic exception, StackTrace stackTrace) {
      //加载失败
      setState(() {
        _image = Image.asset(
          widget.defImagePath,
          width: widget.w,
          height: widget.h,
        );
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _image;
  }
}