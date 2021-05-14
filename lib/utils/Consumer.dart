/*
 * @Description 这是一个便捷类，会获得当前context和指定数据类型的Provider
 * @Author chenjun
 * @Date 2021/5/7
 * @Param
 * @Return
 */
import 'package:flutter/material.dart';

import 'ChangeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  final Widget child;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context) // 自动获取Model
        );
  }
}
