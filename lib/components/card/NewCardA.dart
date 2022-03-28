import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/components/card/BaseCard.dart';
import 'package:flutter_demo/components/card/CardEntity.dart';

import 'mixin/CardState.dart';

/// Created by chenjun on 2022/3/28.
///
class NewCardA extends BaseCard {
  const NewCardA({CardEntity cardEntity, Key key}) : super(cardEntity: cardEntity, key: key);

  @override
  State<StatefulWidget> createState() => _NewCardAState();
}

class _NewCardAState extends State<NewCardA> with CardState<NewCardA> {
  @override
  void onLongPress() {
    print("长按==>覆盖了原方法");
  }
}
