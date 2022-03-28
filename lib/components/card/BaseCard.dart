import 'package:flutter/cupertino.dart';

import 'CardEntity.dart';

/// Created by chenjun on 2022/3/28.
/// card基类
abstract class BaseCard extends StatefulWidget {
  const BaseCard({Key key, this.cardEntity}) : super(key: key);

  final CardEntity cardEntity;

  CardEntity getCard() {
    return cardEntity;
  }
}
