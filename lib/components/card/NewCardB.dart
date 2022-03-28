import 'package:flutter/cupertino.dart';

import 'BaseCard.dart';
import 'CardEntity.dart';
import 'mixin/CardState.dart';

/// Created by chenjun on 2022/3/28.
class NewCardB extends BaseCard {
  const NewCardB({CardEntity cardEntity, Key key}) : super(cardEntity: cardEntity, key: key);

  @override
  State<StatefulWidget> createState() => _NewCardBState();
}

class _NewCardBState extends State<NewCardB> with CardState<NewCardB> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardEntity.height,
      width: widget.cardEntity.width,
      decoration: BoxDecoration(
        color: widget.cardEntity.bgColor,
        borderRadius: widget.cardEntity.radius,
      ),
    );
  }
}
