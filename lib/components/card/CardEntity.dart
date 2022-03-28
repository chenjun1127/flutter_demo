import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// Created by chenjun on 2022/3/28.
/// 卡片实体
class CardEntity {
  String name;
  String id;
  double width;
  double height;
  Color bgColor;
  BorderRadius radius;

  CardEntity(this.name, this.id, this.width, this.height, this.bgColor, this.radius);
}
